

__ScriptVersion="0.0.1"

usage ()
{
  echo "Usage :  $(basename $0) [-h|-help] [-v|-version] command

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -s|seconds    Set the repetition interval (in seconds)
    command       Script or commands to be performed

    watch(1) is a very useful little tool when you want to see the results of a
    command changing over time.

    Unfortunately it seems that it doesn't support Unicode or colours in its
    output. This is a short bash function that does much of what watch can do,
    but with no trouble handling Unicode or coloured output.

    Copyright © 2016 Alejandro Gallo. MIT-LICENSE.
    "
}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

BOTCH_SECONDS=""

while getopts "hvs:" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  s|seconds  )  BOTCH_SECONDS=$OPTARG ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

test $BOTCH_SECONDS || BOTCH_SECONDS=2

#echo $@
#echo "Running every $BOTCH_SECONDS seconds";
#read

while true; do
  clear
  printf "%s \t\t\t\t\t Every %s s\n" $(date +"%H:%M:%S") $BOTCH_SECONDS
  echo -e "\033[0;92m--------\033[0m"
  eval $@
  sleep $BOTCH_SECONDS
done
