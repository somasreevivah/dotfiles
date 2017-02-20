__OPTIONS=":hvud"


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
    -u            Up by some percent
    -d            Down by some percent


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

if type -a osascript; then
  OSX=1
fi

getVolume() {
  if [[ ${OSX} == 1 ]]; then
    sudo osascript -e "output volume of (get volume settings)"
  else
    amixer get Master | sed -n "s/.*\([0-9]\+\)%.*/\1/p"
  fi
}

volumeUp() {
  local down
  up=3
  arrow "Increasing volume by ${up}%"
  amixer -q sset Master ${up}%+
}

volumeDown() {
  local down
  down=3
  arrow "Lowering volume by ${down}%"
  amixer -q sset Master ${down}%-
}

setVolume() {
  local level=$1
  if [[ ${OSX} == 1 ]]; then
    osascript -e "set volume output volume ${level}"
  else
    amixer set Master ${level}
  fi
}

refreshInformations() {
  if type -a i3blocks 2>&1 > /dev/null ; then
    pkill -RTMIN+10 i3blocks
  fi
}

while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  u ) volumeUp ;;

  d ) volumeDown ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))


VOLUME_LEVEL=$1

CURRENT_VOLUME=$(getVolume)

arrow "Current volume is ${CURRENT_VOLUME}%"

if [[ -n ${VOLUME_LEVEL} ]]; then
  if [[ ! $VOLUME_LEVEL = *% && ! ${OSX} == 1 ]]; then
    VOLUME_LEVEL=$VOLUME_LEVEL'%'
    arrow "Interpreting the volume as a percentage $VOLUME_LEVEL"
  fi
  setVolume ${VOLUME_LEVEL}
fi

refreshInformations

