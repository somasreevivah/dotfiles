#! /usr/bin/env bash

header()   { echo -e "\n\033[1m$@\033[0m"; }
success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
error()    { echo -e " \033[1;31mX\033[0m  $@"; }
arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
warning()  { echo -e " \033[0;93m==>\033[0m  $@"; }

pasteClipboard() {
  echo "$@" | xclip -i &&  arrow "Copying to clipboard" || error "Error occurred"
}

__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Secret"
__OPTIONS=":hv"

ENC_METHOD=sha256sum

usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -m            Method
                  Default: ${ENC_METHOD}


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

read -s -p "Password:" pass

pasteClipboard $(${ENC_METHOD} <<<${pass})
echo
${ENC_METHOD} <<<${pass}


#vim-run: bash %


