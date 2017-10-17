#! /usr/bin/env bash


files=$@


for file in ${files[@]} ; do
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  outdir=$(dirname "${file}")
  basename=$(basename "${file}" | sed "s/\.[^.]*$//")
  outfile="${outdir}/${basename}.mp3"
  echo "IN : ${file}"
  echo "OUT: ${outfile}"
  ffmpeg -i "${file}" -f mp3 "${outfile}"
done

#vim-run: bash % nami/fragile-alignments/*
