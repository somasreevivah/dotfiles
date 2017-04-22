#! /usr/bin/env bash

__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Get Flash Videos path being streamed in your system."
__OPTIONS=":hv"


usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
usage ()
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


if [[ $(uname) = Darwin ]]; then
  find /private &>/dev/null | grep "/Flash"
elif [[ $(uname) = Linux ]]; then
  sudo file -h /proc/*/fd/* #2> /dev/null | grep -i Flash 
fi
