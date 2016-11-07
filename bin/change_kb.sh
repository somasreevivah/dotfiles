#! /usr/bin/env bash


__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Change layout of keyboard"
__OPTIONS=":hvl"


header()   { echo -e "\n\033[1m$@\033[0m"; }
success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
error()    { echo -e " \033[1;31mX\033[0m  $@"; }
arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
      -h|help       Display this message
      -v|version    Display script version
      -l            List defined layouts


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------


getCurrentLayout() {
  setxkbmap -print -verbose 10 | grep layout | cut -d : -f2 | tr -d " "
}

refreshInformations() {
  pkill -RTMIN+10 i3blocks #i3blocks refreshing
  echo "${language}-${variant}" > ${KEYBOARD_CURRENT_LANGUAGE}
  cat ${KEYBOARD_CURRENT_LANGUAGE}|\
    timeout .5 dzen2 -p\
    -fg green\
    -bg black\
    -x 20\
    -y 20\
    -w 100\
    -h 100\
    -ta c
}

listLayouts() {
  local layout
  for layout in ${LAYOUTS[@]} ; do
    echo ${layout}
  done
}

setLayout() {
  local layout="$1"
  language=$(cut -d "-" -f1 <<<${layout})
  variant=$(cut -d "-" -f2 <<<${layout})

  arrow "Next layout ${language}  -  ${variant}"

  setxkbmap -layout ${language} $([[ ! ${variant} = none ]] && echo "-variant ${variant}")
}

LAYOUT_INFO_FILE=/usr/share/X11/xkb/rules/base.lst
KEYBOARD_CURRENT_LANGUAGE=${HOME}/.keyboard_current_language

LAYOUTS=(
de-none
ara-qwerty
ru-phonetic
il-phonetic
)

LAYOUTS_LENGTH=${#LAYOUTS[@]}

while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  l  )  listLayouts; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

layout="$1"
if [[ -n ${layout} ]]; then
  SET_LAYOUT=1
  CYCLE_LAYOUT=
else
  SET_LAYOUT=
  CYCLE_LAYOUT=1
fi

if ! which dzen2 &>/dev/null; then
  error "Please install dzen2..."
  exit 1
fi

CURRENT_LAYOUT=$(getCurrentLayout)

arrow "Current layout is ${CURRENT_LAYOUT}"
arrow "We have ${LAYOUTS_LENGTH} languages"

if [[ -n ${CYCLE_LAYOUT} ]]; then
  let counter=-1
  for layout in ${LAYOUTS[@]} ; do
    let counter++
    language=$(cut -d "-" -f1 <<<${layout})
    if [[ ${language} = ${CURRENT_LAYOUT} ]]; then
      let next_index=(counter+1)%LAYOUTS_LENGTH
      break
    fi
  done
  layout=${LAYOUTS[${next_index}]}
fi


setLayout "${layout}"

if [[ $? ]]; then
  refreshInformations
fi


#vim-run: bash %
