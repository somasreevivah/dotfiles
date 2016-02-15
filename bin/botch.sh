

__ScriptVersion="0.0.1"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
  echo "Usage :  $(basename $0) <script> [options] [--]

    Options:
    script        Script or commands to be performed
    -h|help       Display this message
    -v|version    Display script version
    -s|seconds    Set the repetition interval (in seconds)

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

SECONDS=""

while getopts "hvs:" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  s|seconds  )  SECONDS=$OPTARG ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

test -z $SECONDS || SECONDS=2

echo $@
echo "Running every $SECONDS seconds";

read

while true; do
  clear
  date +"%H:%M:%S"
  date +"--------"
  eval $@
  sleep $SECONDS
done
