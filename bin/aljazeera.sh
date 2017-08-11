#! /usr/bin/env bash
url=https://www.youtube.com/watch?v=fN2sEo7hq-E

mpv ${url} ||
mpsyt playurl ${url} ||
firefox ${url}
