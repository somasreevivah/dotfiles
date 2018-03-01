#! /usr/bin/env bash

cmd=$1

mpsytpid=$(xdotool search --name mpsyt)
echo ${mpsytpid}


notify-send \
  -i notification-audio-${cmd} \
  -t 500 ${cmd} "Pid ${mpsytpid} $USER"

if [ ${cmd} == pause ] || [ ${cmd} == play ] || [ ${cmd} == stop ]; then
  xdotool key --window ${mpsytpid} p
elif [ ${cmd} == rewind ]; then
  xdotool type --window ${mpsytpid} left
elif [ ${cmd} == forward ]; then
  xdotool type --window ${mpsytpid} right
elif [ ${cmd} == next ]; then
  xdotool type --window ${mpsytpid} '>'
elif [ ${cmd} == previous ]; then
  xdotool type --window ${mpsytpid} '<'
fi

