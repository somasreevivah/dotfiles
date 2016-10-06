#!/bin/bash




__ScriptVersion="0.0.1"

usage ()
{
  echo "Usage :  $(basename $0) [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version"

}    # ----------  end of function usage  ----------


#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hv" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$(basename $0) -- Version $__ScriptVersion"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))




show-students(){
  for user in $(ps aux | cut -d " " -f1 | sort ); do 
    if [[ $user != $last ]] ; then 
      if [[ $user = [st,ph]* ]]; then
        finger $user | grep "Name:"
      fi
    fi
    last=$user
  done
}

show-students
