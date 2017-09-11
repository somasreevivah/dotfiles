#! /usr/bin/env bash

# template() {
#   [[ $1 = -h ]] &&
#     cat <<EOF
#   $0: Usage
# EOF
# }

get_pictures() {
  [[ $1 = -h ]] && cat <<EOF
  $0: Get pictures from android device
    First Argument: Folder to get them from
    Second Argument: Folder to put them
EOF
  in="${1}"
  out=${2:-.}
  set -x
  adb pull "${in}" "${out}"
  set +x
}

get_all_pictures() {
  [[ $1 = -h ]] && cat <<EOF
  $0: Get all pictures from android device
    Frist Argument: Folder to put them
EOF
  out=${1:-.}
  get_pictures /sdcard/Whatsapp/Media/Whatsapp\ Images ${out}
  get_pictures /sdcard/Telegram/Telegram\ Images ${out}
  get_pictures /sdcard/DCIM/Camera ${out}
}

get_busy_box() {
  # sudo apt-get install crossbuild-essential-arm64
  [[ $1 = -h ]] && cat <<EOF
  $0: Get busybox and compile it for android
EOF
  url="http://busybox.net/downloads/busybox-1.27.2.tar.bz2"
  bb_file=busybox.tar.bz2
  echo "Getting busybox from ${url}"
  [[ -e ${bb_file} ]] || wget ${url} -O ${bb_file}
  [[ -e busybox ]] || {
    mkdir -p busybox;
    tar xvf ${bb_file} --strip-components=1 -C busybox;
  }
  cd busybox &&
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- defconfig &&
  echo "Do a static compilation: Busybox Settins -> Build configuration" &&
  read &&
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig &&
  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- install

}

COMMANDS=(
get_pictures
get_all_pictures
get_busy_box
)

[[ -z $1 ]] && {
  echo "Available commands:";
  for cmd in ${COMMANDS[@]} ; do
    echo "- ${cmd}";
  done
  exit 0;
}

cmd=$1
shift
${cmd} ${@}


#vim-run: bash % get_busy_box
#vim-run: bash %
