#! /usr/bin/env bash
#url=https://www.youtube.com/watch?v=fN2sEo7hq-E # old url
url=https://www.youtube.com/watch?v=0zc9dACzJYY
#doc_url=https://www.youtube.com/watch?v=ZJIDMi_8O5o #old
doc_url=https://www.youtube.com/watch?v=Ntgv6zrhUZQ

if [[ $1 == doc ]]; then
  echo "Aljazeera documentaries"
  url=${doc_url}
else
  echo "Aljazeera news"
fi

mpv ${url} ||
mpsyt playurl ${url} ||
firefox ${url}
