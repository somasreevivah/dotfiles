#i3blocks -c ~/.i3/i3blocks.conf
#py3status
#py3status -c ~/.i3/i3status.conf

if [[ $HOSTNAME == pccq05 ]]; then
  i3status --config ~/.i3/i3status.conf
else
  i3blocks -c ~/.i3/i3blocks.conf
fi
