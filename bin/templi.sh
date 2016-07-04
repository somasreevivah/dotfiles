#! /usr/bin/env bash

__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Minimal template engine written in bash"
__OPTIONS=":hvi:o:dl"


function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h            Display this message
    -v            Display script version
    -i            Input template file
    -o            Output template file (for outputing
                  bash scripts with the templates).
                  If this is set, the result of the template
                  will not be sent to stdout.
    -d            Verbose mode
    -l            List templates in path


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------


#  constants {{{1  #
####################

TEMPLI_PATH="${TEMPLI_PATH}:$HOME/.templi:$HOME/.local/templi"
TMP_FILE=/tmp/templi.tmp
FILE_FOUND=

#  fucntion definition {{{1  #
##############################

function printv() {
  if [[ -n ${VERBOSE} ]]; then
    echo $@
  fi
}


function format_to_template() {
  file_to_convert=$1
  sed '
  #s/\$/\\$/g #s/\([^ ]\)$ / \\$ /g
  #s/\([^ ]\)$ / \\$ /g
  s/\\[^$]/\\\\/g
  s/\$\([0-9]\)/\\$\1/g
  ' ${file_to_convert}
}



function list_templates() {
  for path_dir in $(tr ":" "\n" <<<${TEMPLI_PATH}) ;do
    [[ -d ${path_dir} ]] && for file in ${path_dir}/* ; do
      echo $file
    done
  done
}


#  Command line parsing {{{1  #
###############################


while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  i          )  INPUT_TEMPLATE_FILE=$OPTARG ;;

  o          )  OUTPUT_TEMPLATE_FILE=$OPTARG ;;

  d          )  VERBOSE=1 ;;

  l          )  list_templates; exit 0;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))



#  main code {{{1  #
####################


#  look for file  #
###################
printv "Looking for file ${INPUT_TEMPLATE_FILE}"
if [[ -e ${INPUT_TEMPLATE_FILE} ]]; then

  printv "File found in current directory"

  FILE_FOUND=1

else

  printv "File NOT found in current directory"
  printv "Looking for the file in TEMPLI_PATH"

  for path_dir in $(tr ":" "\n" <<<${TEMPLI_PATH}) ;do

  printv "Looking for file in ${path_dir}"

  INPUT_FILE_SEARCH=${path_dir}/${INPUT_TEMPLATE_FILE}
  if [[ -f ${INPUT_FILE_SEARCH}  ]]; then
    printv "File found in ${path_dir}"
    INPUT_TEMPLATE_FILE=${INPUT_FILE_SEARCH}
    FILE_FOUND=1
    break
  fi
  done

fi

if [[ -z ${FILE_FOUND} ]]; then
  echo "${INPUT_TEMPLATE_FILE} not found in TEMPLI_PATH or in current directory"
  exit 1
else
  printv "File ${INPUT_TEMPLATE_FILE} found"
fi


printv "Preparing template file"



cat > ${TMP_FILE}<<EOF
#! /usr/bin/env sh

$(tr ":" "\n" <<<$@ | while read pair; do echo $pair; done)

cat <<TEMPLIEOF


$(format_to_template ${INPUT_TEMPLATE_FILE})


TEMPLIEOF

EOF



printv "Done preparing template file"

printv "Running the script"


chmod +x ${TMP_FILE}
if [[ -z ${OUTPUT_TEMPLATE_FILE} ]]; then
  ${TMP_FILE}
else
  cp ${TMP_FILE} ${OUTPUT_TEMPLATE_FILE}
fi

