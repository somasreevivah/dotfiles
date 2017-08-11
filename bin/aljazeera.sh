#! /usr/bin/env bash
url=https://www.youtube.com/watch?v=fN2sEo7hq-E
doc_url=https://www.youtube.com/watch?v=ZJIDMi_8O5o

if [[ $1 == doc ]]; then
  echo "Aljazeera documentaries"
  url=${doc_url}
else
  echo "Aljazeera news"
fi

mpv ${url} ||
mpsyt playurl ${url} ||
firefox ${url}
