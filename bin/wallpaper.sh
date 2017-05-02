#! /usr/bin/env bash

header()   { echo -e "\n\033[1m$@\033[0m"; }
success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
error()    { echo -e " \033[1;31mX\033[0m  $@"; }
arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
warning()  { echo -e " \033[0;93m==>\033[0m  $@"; }

WALLPAPERS_DIR=$HOME/.dotfiles/wallpapers
IMAGE_PATH=${WALLPAPERS_DIR}/temporary.jpg

mkdir -p ${WALLPAPERS_DIR}

if [[ $(uname) = Linux ]]; then
  SORT="sort"
else
  SORT="gsort"
fi


set_wallpaper() {
  [[ -n $1 ]] && IMAGE_PATH=$1
  arrow "Setting wallpaper"
  #Using feh
  if which osascript 2>&1 > /dev/null; then
    arrow "Through osascript..."
    # before mavericks
    #osascript -e '
    #tell application "Finder"
    #set desktop picture to POSIX file "'${IMAGE_PATH}'"
    #end tell
    #'
    # From mavericks on
    sqlite3 \
      ~/Library/Application\ Support/Dock/desktoppicture.db \
      "update data set value = '${IMAGE_PATH}'" && killall Dock
  elif which feh 2>&1 > /dev/null; then
    arrow "Trhough feh..."
    feh --bg-max ${IMAGE_PATH} \
     && wall_success "Wallpaper set" \
     || wall_error "Failure setting wallpaper"
  elif which xv 2>&1 > /dev/null; then
    arrow "Through xv.."
    xv -root -quit "${IMAGE_PATH}"
  fi
}

wall_error (){
  local message=$1
  error ${message}
  if which dzen2 2>&1 > /dev/null ; then
    echo ${message}|\
      timeout 1 dzen2 -p\
      -fg red\
      -bg black\
      -x 0\
      -y 20\
      -w 200\
      -h 100\
      -ta c
  elif which kdialog 2>&1 > /dev/null ; then
    kdialog --error "${message}" 1
  elif which notify-send 2>&1 > /dev/null ; then
    notify-send -t 1000 "Wallpaper" "${message}"
  fi
  return 0
}

wall_notify() {
  local message=$1
  if which dzen2  2>&1 > /dev/null ; then
    success ${message}
    echo ${message}|\
      timeout 1 dzen2 -p\
      -fg white\
      -bg black\
      -x 0\
      -y 20\
      -w 200\
      -h 100\
      -ta c
  elif which kdialog 2>&1 > /dev/null ; then
    kdialog --passivepopup "${message}" 1
  elif which notify-send 2>&1 > /dev/null ; then
    notify-send -t 1000 "Wallpaper" "${message}"
  fi
  return 0
}

wall_success() {
  local message=$1
  if which dzen2  2>&1 > /dev/null ; then
    success ${message}
    echo ${message}|\
      timeout 1 dzen2 -p\
      -fg green\
      -bg black\
      -x 0\
      -y 20\
      -w 200\
      -h 100\
      -ta c
  elif which kdialog 2>&1 > /dev/null ; then
    kdialog --passivepopup "${message}" 1
  elif which notify-send 2>&1 > /dev/null ; then
    notify-send -t 1000 "Wallpaper" "${message}"
  fi
  return 0
}


#  Parsers {{{1  #
##################

david_lloyd(){
  local fmt="jpg"
  local names
  local url
  local sections=(
  recent
  colour
  black-and-white
  big-cat-photo-safari
  great-migration-photo-safari
  british
  )
  local cat=$(echo ${sections[@]} | tr " " "\n" | ${SORT} -R | head -1)
  local url_root="http://davidlloyd.net"
  local url_base="${url_root}/galleries/${cat}/"
  names=$(
  curl -s ${url_base}\
    | grep img \
    | sed -n "s/.*src\s*=\s*\"\(.*\.${fmt}\)\".*/\1/p"
    )
  url="${url_root}/$(echo ${names} | tr " " "\n" | ${SORT} -R | head -1 )"
  wget ${url} -O ${IMAGE_PATH} || wall_error "Failure"
}

local_wallpaper() {
  local imageFile=$(ls $WALLPAPERS_DIR \
    | ${SORT} -R \
    | grep -v ${IMAGE_PATH} \
    | tail -1)
  IMAGE_PATH=$WALLPAPERS_DIR/$imageFile
}

nasa_mars() {
  local cat=${1:-images}
  local url_base="http://mars.jpl.nasa.gov/multimedia/${cat}/"
  local fmt="jpg"
  local names
  local url
  names=$(\
  curl -s ${url_base} \
    | sed "s/href/\rhref/g"\
    | grep href \
    | grep -i "Full resolution" \
    | sed -n "s/.*href\s*=\s*\"\(.*\.${fmt}\)\".*/\1/p"\
    | xargs -n1 -I FF echo ${url_base}FF
  )
  url=$(echo ${names} | tr " " "\n" | ${SORT} -R | head -1 )
  warning "Downloading ${url} ... "
  wget ${url} -O ${IMAGE_PATH} || wall_error "Failure"
}

mars_as_art() {
  #http://mars.jpl.nasa.gov/multimedia/marsasart/
  nasa_mars "marsasart"
}

wallpaperscraft() {
  local url_base="https://wallpaperscraft.com"
  #local resolution="1600x1200"
  local resolution="1920x1080"
  local fmt="jpg"
  local names
  local url
  local modalities=(
  space
  3D
  abstract
  textures
  )
  local modality=$(echo ${modalities[@]} | tr " " "\n" | ${SORT} -R | head -1)
  echo "Searching for modality ${modality}"

  names=$(curl -s "${url_base}/catalog/${modality}/${resolution}" \
    | grep img \
    | sed -n "s/.*src\s*=\s*\"\(.*\.${fmt}\)\".*/\1/p"\
    | xargs -n1 -I FF echo http:FF \
    | sed "s/[0-9]\+x[0-9]\+\.${fmt}/${resolution}.${fmt}/"
  )
  #base_url/image/black_background_red_color_paint_explosion_burst_9844_1600x1200.jpg
  url=$(echo ${names} | tr " " "\n" | ${SORT} -R | head -1 )
  echo "Downloading ${url} ... "
  wget ${url} -O ${IMAGE_PATH} || wall_error "Failure"
}

hubble() {
  #fetch images from
  #http://hubblesite.org/gallery/wallpaper
  local names
  local year
  local number
  local url
  local resolution
  names=$(curl -s http://hubblesite.org/gallery/wallpaper/ \
    | sed -n "s/.*href=\"\/gallery\/wallpaper\/\([0-9a-z]\+\)\/.*/\1/p"\
    | ${SORT} -R | tail -1)
  year=$(sed "s/^[a-z][a-z]\([0-9]\{4\}\).*/\1/" <<<$names)
  number=$(sed "s/^[a-z][a-z][0-9]\{4\}0\([0-9]\{2\}\).*/\1/" <<<$names)
  letter=$(sed "s/^[a-z][a-z][0-9]\{4\}0[0-9]\{2\}\([a-z]\).*/\1/" <<<$names)
  resolution="2560x1024"
  echo ${names}
  echo "$year"
  echo "$number"
  echo "${tmp}"
  url="http://imgsrc.hubblesite.org/hu/db/images/hs-${year}-${number}-a-${resolution}_wallpaper.jpg"
  echo "Downloading ${url} ... "
  wget ${url} -O ${IMAGE_PATH} || wall_error "Failure"
}

wallpapercave() {
  local fmt="jpg"
  local names
  local url
  local sections=(
  wildlife-wallpaper
  wildlife-wallpapers
  free-wildlife-wallpaper
  wildlife-desktop-backgrounds
  wildlife-backgrounds-for-desktop
  )
  local cat=$(echo ${sections[@]} | tr " " "\n" | ${SORT} -R | head -1)
  local url_root="http://wallpapercave.com"
  local url_base="${url_root}/${cat}"
  names=$(
  curl -s "${url_base}"\
    | grep img \
    | grep wpimg \
    | sed -n "s/.*src\s*=\s*\"\(.*\.${fmt}\)\".*/\1/p"
    )
  url="$(echo ${names} | tr " " "\n" | ${SORT} -R | head -1 )"
  echo $names
  arrow "Img url : ${url}"
  wget ${url} -O ${IMAGE_PATH} || wall_error "Failure"
}




#  CLI parser {{{1  #
#####################

__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Set wallpaper"
__OPTIONS=":hvls:"

PARSERS=(
local_wallpaper
hubble
wallpaperscraft
nasa_mars
mars_as_art
david_lloyd
wallpapercave
)

function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -l            List source names
    -s            Set wallpaper by filename


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

while getopts $__OPTIONS opt; do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  l  )
    for s in ${PARSERS[@]} ; do
      echo "${s}"
    done
    exit 0
    ;;
  s )
    set_wallpaper ${OPTARG}
    exit 0
    ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))



#  Main {{{1  #
###############



if [[ -n $1 ]]; then
  parse=$1
else
  parse=$(echo ${PARSERS[@]} | tr " " "\n" | ${SORT} -R | tail -1)
fi



wall_notify $parse

${parse}

set_wallpaper


#vim-run: bash % wallpapercave
#vim-run: bash % wallpaperscraft
#vim-run: bash % david_lloyd
#vim-run: bash % nasa_mars
#vim-run: bash % local_wallpaper
#vim-run: bash % mars_as_art

