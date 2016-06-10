__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Simple script to change volume"
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


VOLUME_LEVEL=$1


###############
#  In debian  #
###############
if uname -a | grep -i debian &>/dev/null ; then

  if [[ ! $VOLUME_LEVEL = *% ]]; then
    VOLUME_LEVEL=$VOLUME_LEVEL'%'
    arrow "Interpreting the volume as a percentage $VOLUME_LEVEL"
  fi

  if which mixer &> /dev/null; then
    error "This script uses mixer in debian, please install it\n\t sudo apt-get install amixer"
    exit 1
  fi
  amixer set Master $VOLUME_LEVEL
fi
