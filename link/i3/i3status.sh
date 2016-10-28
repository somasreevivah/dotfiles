#! /usr/bin/env bash

STATUS_FILE=$HOME/.i3/i3status.conf
on_compaq() { if [[ $(hostname) =~ compaq ]]; then return 0; else return 1; fi }
on_acer() { if [[ $(hostname) =~ localhost ]]; then return 0; else return 1; fi }
on_lenovo() { if [[ $(hostname) =~ lenovo ]]; then return 0; else return 1; fi }


# Clean config file
echo "" > ${STATUS_FILE}

if on_lenovo; then
  INTERVAL=1
else
  INTERVAL=5
fi

if on_lenovo || on_compaq; then
  WIRELESS_INTERFACE=wlan0
else
  WIRELESS_INTERFACE=wlan1
fi


#  general {{{1  #
##################

cat >> ${STATUS_FILE} <<EOF_I3STATUS
# This file was automatically generated by
# the script ~/.i3/i3status.sh on $(date)
#
# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        #output_format="dzen2"
        colors = true
        interval = ${INTERVAL}
}

#order += "ipv6"
order += "disk /"
#order += "run_watch DHCP"
#order += "run_watch VPN"
order += "wireless ${WIRELESS_INTERFACE}"
order += "ethernet eth0"
order += "battery 0"
order += "battery 1"
order += "load"
order += "tztime local"
order += "volume master"

wireless ${WIRELESS_INTERFACE} {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet eth0 {
        # if you use %speed, i3status requires root privileges
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

volume master {
    format = "♪: %volume"
    #format_muted = "♪: muted (%volume)"
    device = "default"
    mixer = "Master"
    mixer_idx = 0
}
run_watch DHCP {
        pidfile = "/var/run/dhclient*.pid"
}
run_watch VPN {
        pidfile = "/var/run/vpnc/pid"
}
EOF_I3STATUS

#  Battery {{{1  #
##################

if on_compaq ; then

cat >> ${STATUS_FILE} <<EOF_I3STATUS
battery 1 {
        format = "%status %percentage %remaining"
}
EOF_I3STATUS

elif on_acer; then

cat >> ${STATUS_FILE} <<EOF_I3STATUS
battery 0 {
        format = "%status %percentage %remaining"
}
EOF_I3STATUS

else

cat >> ${STATUS_FILE} <<EOF_I3STATUS

#battery 0 {
        #format = "%percentage %remaining"
        #path   = /sys/class/power_supply/BAT1/uevent
#}
battery 1 {
        format = "%status %percentage %remaining"
}
battery 0 {
        format = "%status %percentage %remaining"
}

EOF_I3STATUS

fi




#  time {{{1  #
###############

if on_compaq; then

cat >> ${STATUS_FILE} <<EOF_I3STATUS
tztime local {
        format = "%H:%M:%S"
}
EOF_I3STATUS
else
cat >> ${STATUS_FILE} <<EOF_I3STATUS
tztime local {
        format = "%d-%m-%Y %H:%M:%S"
}
EOF_I3STATUS
fi


#  load {{{1  #
###############
cat >> ${STATUS_FILE} <<EOF_I3STATUS
load {
        format = "%1min"
}
EOF_I3STATUS


#  Disk usage {{{1  #
#####################
if ! on_compaq; then
cat >> ${STATUS_FILE} <<EOF_I3STATUS
disk "/" {
        format = "%avail"
}
EOF_I3STATUS
fi

#vim: fdm=marker
