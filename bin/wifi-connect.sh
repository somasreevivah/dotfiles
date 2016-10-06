#!/usr/bin/env bash

__ScriptVersion="0.0.2"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
VERBOSE="true"
CONF_FILE=""
INTERFACE="eth1"

header()   { echo -e "\n\033[1m$@\033[0m"; }
success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }


vprint (){
  if test -n $VERBOSE; then
    echo $@
  fi
}

usage ()
{
  echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -s            SSID of the network to connect to
    -i            Interface, default is $INTERFACE
    -l|list       List saved configuration files
    -q|quiet      Quiet mode, less verbose
    -w            List wireless connections
    -i            Interface, default is $INTERFACE
    -d            With dialog command.
                  You must have 'dialog' installed.
    "

}    # ----------  end of function usage  ----------

list_wireless_connections() {
  sudo iwlist $INTERFACE scan | grep -e ESSID -e Quality | sed -e "s/\"//g" -e "s/ESSID:/\n\t/" 
}

list_configuration_files() {
  for file in /etc/wpa_supplicant/*.conf; do
    echo $file
  done
}

connect() {
  arrow "Trying to connect"
  if test -n "$1"; then
    check_ssid $1
  else
    check_wifi
  fi
  connect_wpa
}

connect_wpa() {
  [[ -n $1 ]] && CONF_FILE=$1
  if test -n "$CONF_FILE"; then
    sudo wpa_supplicant -B -i $INTERFACE -D wext -c $CONF_FILE
    sudo dhclient $INTERFACE
  else
    error "Configuration file not found"
    exit 1
  fi
}

check_ssid() {
  arrow "Checking the config file for network $1 is already in the system"
  ssid=$1
  for my_ssid in /etc/wpa_supplicant/*.conf; do
    if [[ "$ssid.conf" = "$(basename $my_ssid)" ]]; then
      success "Detected a saved configuration file for network $ssid"
      CONF_FILE=$my_ssid
    fi
  done
}

check_wifi() {
  arrow "Checking if a config file for current networks exists"
  for ssid in $( sudo iwlist scan | grep ESSID | sed -e "s/ESSID://" -e "s/\"//g" | cat); do
    check_ssid $ssid
  done
}


#######################################################################
#                    HANDLE COMMAND LINE ARGUMENTS                    #
#######################################################################

while getopts ":hvqs:lwi:d" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  q|quiet  )  VERBOSE=""   ;;

  d )  WITH_DIALOG=1   ;;

  i )  INTERFACE=$OPTARG   ;;

  l|list  )  list_configuration_files  ; exit 0;;

  w )  list_wireless_connections  ; exit 0;;

  s|ssid  )
    connect $OPTARG
    exit 0
  ;;

  \? )  echo -e "\n  Option does not exist : $OPTARG\n"; usage; exit 1   ;;
  : )  echo -e "Option -$OPTARG requires an argument";  exit 1 ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))



#####################################
#  SELECT LOOP FOR SIMPLE CHOOSING  #
#####################################

PS3="Which to connect to?  "
if [[ -z $WITH_DIALOG ]]; then
  select ssid_path in $( list_configuration_files ); do
    arrow "You have selected $ssid_path, connecting to it..."
    connect_wpa $ssid_path
    exit 0
  done
else
  dialog --radiolist "$PS3 (press space to select)" 80 90 70 $( for i in $(list_configuration_files); do echo -n "$(echo $i)" "$i" "off" ; done ) 2> /tmp/dialog
  ssid_name=$(cat /tmp/dialog)
  dialog --msgbox "You chose $ssid_name, we will be connecting..." 30 50
  connect_wpa $ssid_name && dialog --msgbox "Connection established" || dialog --msgbox "Could not connect, check stuff up"
fi



