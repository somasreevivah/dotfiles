#! /usr/bin/env bash

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

USER_NAME=$USER


__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Utility to cancel the jobs of the loadleveler llcancel command"


function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version"

    This program is working only in environments
    where a loadleveler and the llq/llcancel commands exist

    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

while getopts ":hv" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

########################
#  Check if on abakus  #
########################

if [[ ! $HOSTNAME =~ abakus ]]; then
  echo You are not in abakus, oh well nevermind ...
  ABA="ssh abakus01"
else
  ABA=
fi

LLQ="${ABA} llq"
LLCANCEL="${ABA} llcancel"

JOBS_IDS=$(${LLQ} | grep $USER | awk '{print $1}')

if [[ -z $JOBS_IDS ]]; then
  success "User $USER_NAME has no jobs running in this cluster"
  exit 0
fi

header "Which job would you like to cancel? (e.g.: 1 2 3 4   //   all  //  1)"
number=1
for id in $JOBS_IDS; do
  echo -e " \033[45m$number\033[0m. $id"
  number=$((number+1))
done

read jobs_to_cancel

if [[ $jobs_to_cancel = "all" ]]; then
  arrow "Cancelling all jobs"
  for id in $JOBS_IDS; do
    ${LLCANCEL} $id && success "$id cancelled"
  done
fi

for n in $jobs_to_cancel; do
  number=1
  for id in $JOBS_IDS; do
    if [[ $n = $number ]]; then
      ${LLCANCEL} $id && success "$id cancelled"
    fi
    number=$((number+1))
  done
done
