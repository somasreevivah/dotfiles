#! /usr/bin/env bash


files=$@

tomp3() {
  file="$1"
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  outdir=$(dirname "${file}")
  basename=$(basename "${file}" | sed "s/\.[^.]*$//")
  outfile="${outdir}/${basename}.mp3"
  echo "IN : ${file}"
  echo "OUT: ${outfile}"
  ffmpeg -i "${file}" -f mp3 "${outfile}"
}

export -f tomp3

if type -a parallel; then
  echo "Running in parallel"
  parallel tomp3 ::: ${files[@]}
else
  for file in ${files[@]} ; do
    tomp3 "${file}"
  done
fi


#vim-run: bash % nami/fragile-alignments/*
