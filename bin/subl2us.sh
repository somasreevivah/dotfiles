#! /usr/bin/env bash


function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="Sublime snippets format to UltiSnips snippets format."


function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version] file1 file2 ..."; }
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

FILES=$(echo $@)
FOLDER="UltiSnips"

[[ ! -d $FOLDER ]] && mkdir $FOLDER

for file in $FILES ; do
  if [[ ! -f $file ]]; then
    error "File $file does not exist"
    continue
  fi
  filename_base=$(basename ${file} .sublime-snippet)
  SNIPPET_FILE="$FOLDER/${filename_base}.snippets"
  header "Processing $file"
  tabTrigger=$(sed -n "
  /<tabTrigger>/,/<\/tabTrigger>/ {
  s/<tabTrigger>//
  s/^\s*//
  s/<\/tabTrigger>//p
} " ${file})
  description=$(sed -n "
  /<description>/,/<\/description>/ {
  s/<description>//
  s/^\s*//
  s/<\/description>//p
} " ${file})
  content=$(sed -n "
  /<content>/,/<\/content>/ {
  s/<content>//
  s/]]><\/content>//
  s/<!\[CDATA\[//
  /^\s*$/d
  p
} " ${file})

  #echo ${tabTrigger}
  #echo ${description}
  #echo ${content}

  cat | tee ${SNIPPET_FILE} <<EOF
snippet ${tabTrigger} "${description}" b
${content}
endsnippet
EOF


done


#vim-run: bash % functor.sublime-snippet
