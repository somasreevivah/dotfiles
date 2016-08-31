
SCRIPT_DIR=$(dirname $0)
IMAGE_PATH=~/.dotfiles/wallpapers/temporary.jpg

function local_wallpaper() {
  local WALLPAPERS_DIR="${SCRIPT_DIR}/../wallpapers"
  local IMAGE_FILE=$(ls $WALLPAPERS_DIR | sort -R | tail -1)
  IMAGE_PATH=$WALLPAPERS_DIR/$IMAGE_FILE
}

function hubble() {
  #fetch images from
  #http://hubblesite.org/gallery/wallpaper/pr2006010a/2560x1024_wallpaper/
  local names
  local year
  local number
  local url
  local resolution
  local tmp=$(mktemp).jpg
  names=$(curl -s http://hubblesite.org/gallery/wallpaper/ \
    | sed -n "s/.*href=\"\/gallery\/wallpaper\/\([0-9a-z]\+\)\/.*/\1/p"\
    | sort -R | tail -1)
  year=$(sed "s/^[a-z][a-z]\([0-9]\{4\}\).*/\1/" <<<$names)
  number=$(sed "s/^[a-z][a-z][0-9]\{4\}0\([0-9]\{2\}\).*/\1/" <<<$names)
  resolution="2560x1024"
  echo ${names}
  echo "$year"
  echo "$number"
  echo "${tmp}"
  url="http://imgsrc.hubblesite.org/hu/db/images/hs-${year}-${number}-a-${resolution}_wallpaper.jpg"
  wget ${url} -O ${IMAGE_PATH}
}

PARSERS=(
local_wallpaper
hubble
)

parse=$(echo ${PARSERS[@]} | tr " " "\n" | sort -R | tail -1)

which feh &> /dev/null || exit 1


${parse}

feh --bg-fill $IMAGE_PATH

#vim-run: bash %

