#! /usr/bin/env bash

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
function warning()  { echo -e " \033[0;93m==>\033[0m  $@"; }

if ! type w3m 2>&1 > /dev/null; then
  error "Install w3m"
  exit 1
fi


w3m -dump https://intranet.fkf.mpg.de/92893/10_Wochenprogramm \
  | python <(cat <<"EOF"

import re
import os
import hashlib
import sys

apts = os.path.expanduser("~/.calcurse/apts")
notes = os.path.expanduser("~/.calcurse/notes/")

def printAppointment(date, hours, minutes, kind, body):
    import datetime
    year     = datetime.datetime.now().year
    m        = re.match(r"([0-9]+)\.([0-9]+).*", date)
    day      = m.group(1)
    month    = m.group(2)
    noteName = "%s_%s_%s_%s_%s_%s"%(day,month,year,hours,minutes, kind)
    noteHash = hashlib.md5(noteName).hexdigest()
    aptLine  = "%s/%s/%s @ %s:%s -> %s/%s/%s @ %s:%s>%s |%s\n"%(
        month,day,year,
        hours,minutes,
        month,day,year,
        int(hours)+1,minutes,
        noteHash,
        kind
        )
    print(aptLine)
    f = open(os.path.join(notes,noteHash), "w").write(body)
    d = open(apts, "a+").write(aptLine)

date    = None
hours   = None
minutes = None
kind    = None
body    = ""
flush   = False

for line in sys.stdin:
    m = re.match(r"\s*[A-Z][a-z]:\s*(.*)", line)
    # print(line)
    if m:
        if hours and minutes and kind:
            flush = True
        date = m.group(1)
    if date:
        m2 = re.match(r"\s*([0-9][0-9]):\s*([0-9][0-9])\s*(.*)", line)
        if m2:
            if hours and minutes and kind:
                flush = True
        if not flush:
            body += line
        else:
            printAppointment(date, hours, minutes, kind, body)
            hours = None; minutes = None; kind = None; body = "";
            flush = False
        if m2:
            hours   = m2.group(1)
            minutes = m2.group(2)
            kind    = m2.group(3)


EOF
)


#vim-run: bash %
