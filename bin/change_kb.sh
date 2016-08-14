#! /usr/bin/env bash


__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Change layout of keyboard"
__OPTIONS=":hv"


function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

function getLayout() {
  setxkbmap -print -verbose 10 | grep layout | cut -d : -f2 | tr -d " "
}

LAYOUT_INFO_FILE=/usr/share/X11/xkb/rules/base.lst
KEYBOARD_CURRENT_LANGUAGE=${HOME}/.keyboard_current_language

LANGUAGES=(
de-none
ara-qwerty
ru-phonetic
il-phonetic
)
#LANGUAGES=(
#de-none
#us-none
#)

LANGUAGES_LENGTH=${#LANGUAGES[@]}


if ! which dzen2 &>/dev/null; then
  error "Please install dzen2..."
  exit 1
fi

CURRENT_LAYOUT=$(getLayout)

arrow "Current layout is ${CURRENT_LAYOUT}"
arrow "We have ${LANGUAGES_LENGTH} languages"

let counter=-1
for language in ${LANGUAGES[@]} ; do
  let counter++
  layout=$(cut -d "-" -f1 <<<${language})
  if [[ ${layout} = ${CURRENT_LAYOUT} ]]; then
    let next_index=(counter+1)%LANGUAGES_LENGTH
    break
  fi
done


layout=$(cut -d "-" -f1 <<<${LANGUAGES[${next_index}]})
variant=$(cut -d "-" -f2 <<<${LANGUAGES[${next_index}]} )

arrow "Next layout ${layout}  -  ${variant}"

setxkbmap -layout ${layout} $([[ ! ${variant} = none ]] && echo "-variant ${variant}")

if [[ $? ]]; then
  echo ${layout} > ${KEYBOARD_CURRENT_LANGUAGE}
  #zenity --notification --text "${layout}" --timeout 1
  echo ${layout} |\
    timeout .5 dzen2 -p\
    -fg green\
    -bg black\
    -w 100\
    -h 100\
    -x 20\
    -y 20
fi


#vim-run: bash %
