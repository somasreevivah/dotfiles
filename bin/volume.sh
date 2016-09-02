__OPTIONS=":hvud"


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
    -u            Up by some percent
    -d            Down by some percent


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

function getVolume() {
  amixer get Master | sed -n "s/.*\([0-9]\+\)%.*/\1/p"
}

function volumeUp() {
  local down
  up=3
  arrow "Increasing volume by ${up}%"
  amixer -q sset Master ${up}%+
}

function volumeDown() {
  local down
  down=3
  arrow "Lowering volume by ${down}%"
  amixer -q sset Master ${down}%-
}

function refreshInformations() {
  pkill -RTMIN+10 i3blocks
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

if ! which amixer &> /dev/null; then
  error "This script uses mixer in debian, please install it\n\t sudo apt-get install amixer"
  exit 1
fi

VOLUME_LEVEL=$1

CURRENT_VOLUME=$(getVolume)

arrow "Current volume is ${CURRENT_VOLUME}%"

if [[ -n ${VOLUME_LEVEL} ]]; then
  if [[ ! $VOLUME_LEVEL = *% ]]; then
    VOLUME_LEVEL=$VOLUME_LEVEL'%'
    arrow "Interpreting the volume as a percentage $VOLUME_LEVEL"
  fi
  amixer set Master $VOLUME_LEVEL
fi

refreshInformations

