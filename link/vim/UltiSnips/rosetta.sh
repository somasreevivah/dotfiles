#! /usr/bin/env bash
__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Rosetta utility"
__OPTIONS=":hvl:"


function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version] [-l language] <command>"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -l            Language for processing options (regex)

    Command:
     check        Check the status of the snippets for a given language
                  with -l flag or for all languages
     template     Print out a template


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  l    )  PROG_LANGUAGE=$OPTARG;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))


####################
#  MAIN VARIABLES  #
####################

COMMAND=$1
PROG_LANGUAGE=${PROG_LANGUAGE:-'-E .'}


####################
#  MAIN FUNCTIONS  #
####################
function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32mO\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m->>\033[0m  $@"; }

get_rosetta_snippets() {
  declare -x -r SNIPPET_FILENAME=rosetta.snippets
  find . -name $SNIPPET_FILENAME | grep --color=never $PROG_LANGUAGE
}

check_triggers() {
  declare -x -r path=$1
  declare -x -r TRIGGERS_DB="./rosetta/triggers.db"
  cat $TRIGGERS_DB | while read trigger_line ; do

  trigger=$(echo $trigger_line | cut -d " " -f 1)
  description=$(echo $trigger_line | cut -d " " -f 2-)

  if [[ $description = $trigger ]]; then
    header $trigger
    continue
  fi

  snippet_line=$(sed -n "/^snippet\s\+${trigger}/p" ${path} )
  if [[ -n ${snippet_line} ]]  ; then
    success "\033[0;36m$trigger\033[0m found"
  else
    error "\033[0;36m$trigger\033[0m not found"
  fi

  description=""

  done
}

create_template() {
  declare -x -r TRIGGERS_DB="./rosetta/triggers.db"
  cat ${TRIGGERS_DB} | while read line; do
  trigger=$(echo $line | cut -d " " -f 1)
  description=$(echo $line | cut -d " " -f 2-)
  if [[ $description = $trigger && -n ${description} ]]; then
    #main separator
    echo -e "\n\n### ${trigger} {{{1\n\n"
    continue
  fi
  if [[ -z ${trigger} ]]; then
    continue
  fi
  cat <<EOF
#snippet ${trigger} "${description}" b
#endsnippet
EOF

done
}

if [[ $COMMAND =~ check ]]; then
  for file in $(get_rosetta_snippets ) ; do
    header "\033[1;36mLANGUAGE\033[0m: \033[46m\033[1;93m    $( dirname ${file} | sed "s/\.\///")    \033[0m\033[0m"
    check_triggers $file
  done
elif [[ ${COMMAND} = template ]]; then
  create_template
fi

#vim-run: bash % -l perl check
#vim-run: bash % template


