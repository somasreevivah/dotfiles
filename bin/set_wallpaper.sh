#! /usr/bin/env bash

WALLPAPERS_DIR=$(readlink -f ~/.dotfiles/wallpapers)
IMAGE_PATH=${WALLPAPERS_DIR}/temporary.jpg

function wall_notify() {
  type dzen2 > /dev/null || return 1
  local message=$1
  echo ${message}|\
    timeout 1 dzen2 -p\
    -fg red\
    -bg black\
    -x 20\
    -y 20\
    -w 200\
    -h 100\
    -ta c
}

function local_wallpaper() {
  local imageFile=$(ls $WALLPAPERS_DIR \
    | sort -R \
    | grep -v ${IMAGE_PATH} \
    | tail -1)
  IMAGE_PATH=$WALLPAPERS_DIR/$imageFile
}

function hubble() {
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
  wget ${url} -O ${IMAGE_PATH}
}

PARSERS=(
local_wallpaper
hubble
)

parse=$(echo ${PARSERS[@]} | tr " " "\n" | sort -R | tail -1)

type feh 2>&1 > /dev/null || exit 1


wall_notify $parse

${parse}

feh --bg-max $IMAGE_PATH

#vim-run: bash %

