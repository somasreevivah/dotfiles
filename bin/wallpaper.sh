#! /usr/bin/env bash

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
function warning()  { echo -e " \033[0;93m==>\033[0m  $@"; }

WALLPAPERS_DIR=$(readlink -f ~/.dotfiles/wallpapers)
IMAGE_PATH=${WALLPAPERS_DIR}/temporary.jpg
mkdir -p ${WALLPAPERS_DIR}

wall_notify() {
  local message=$1
  if type dzen2 > /dev/null ; then
    arrow ${message}
    echo ${message}|\
      timeout 1 dzen2 -p\
      -fg red\
      -bg black\
      -x 0\
      -y 20\
      -w 200\
      -h 100\
      -ta c
  fi
}

local_wallpaper() {
  local imageFile=$(ls $WALLPAPERS_DIR \
    | sort -R \
    | grep -v ${IMAGE_PATH} \
    | tail -1)
  IMAGE_PATH=$WALLPAPERS_DIR/$imageFile
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
  local modality=$(echo ${modalities[@]} | tr " " "\n" | sort -R | head -1)
  echo "Searching for modality ${modality}"

  names=$(curl -s "${url_base}/catalog/${modality}/${resolution}" \
    | grep img \
    | sed -n "s/.*src\s*=\s*\"\(.*\.${fmt}\)\".*/\1/p"\
    | xargs -n1 -I FF echo http:FF \
    | sed "s/[0-9]\+x[0-9]\+\.${fmt}/${resolution}.${fmt}/"
  )
  #base_url/image/black_background_red_color_paint_explosion_burst_9844_1600x1200.jpg
  url=$(echo ${names} | tr " " "\n" | sort -R | head -1 )
  echo "Downloading ${url} ... "
  wget ${url} -O ${IMAGE_PATH} || wall_notify "Failure"
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
    | sort -R | tail -1)
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
  wget ${url} -O ${IMAGE_PATH} || wall_notify "Failure"
}




PARSERS=(
local_wallpaper
hubble
wallpaperscraft
)


if [[ -n $1 ]]; then
  parse=$1
else
  parse=$(echo ${PARSERS[@]} | tr " " "\n" | sort -R | tail -1)
fi



wall_notify $parse

${parse}

type feh 2>&1 > /dev/null || exit 1
feh --bg-max $IMAGE_PATH || wall_notify "Failure setting wallpaper"

#vim-run: bash % wallpaperscraft

