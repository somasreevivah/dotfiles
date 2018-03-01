#! /usr/bin/env bash

cmd=$1

mpsytpid=$(xdotool search --name mpsyt)
echo ${mpsytpid}

notify(){
  notify-send \
    -i notification-audio-${cmd} \
    -t 500 ${cmd} "Pid ${mpsytpid} $USER"
}

if [ ${cmd} == pause ] || [ ${cmd} == play ] || [ ${cmd} == stop ]; then
  notify
  xdotool key --window ${mpsytpid} p
elif [ ${cmd} == rewind ]; then
  xdotool type --window ${mpsytpid} down
elif [ ${cmd} == forward ]; then
  xdotool type --window ${mpsytpid} up
elif [ ${cmd} == next ]; then
  notify
  xdotool type --window ${mpsytpid} '>'
elif [ ${cmd} == previous ]; then
  notify
  xdotool type --window ${mpsytpid} '<'
fi

