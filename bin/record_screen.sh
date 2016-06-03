#!/bin/sh

# NTSC 720x486 in columns 88x27

DIRNAME=$(date | tr " " "_")
mkdir -p $DIRNAME

function create_video() {
  echo "Putting together images ... "
  echo "Please wait ..."
  convert -antialias -resize 720x486! -delay 60 $DIRNAME/* CAPTURE_$DIRNAME.gif
  echo "Done!"
  echo "Cleaning up images ..."
  du -h $DIRNAME
  rm -rf $DIRNAME
  exit 0
}

trap create_video SIGINT SIGTERM

echo "Recording ..."
i=0
while [ 1 ]
do
  x=$[i+10000];
  import -frame -window root "$DIRNAME/cap_${x/1/}.png"
  i=$(( $i + 1 ))
  # sleep 2s
done

