#! /usr/bin/env python2
# -*- coding: utf-8 -*-

import os,sys
import urllib

############################
#  COMMAND LINE INTERFACE  #
############################
import argparse

parser = argparse.ArgumentParser(description="Morfix wrapper for console")

parser.add_argument("-v", "--verbose", help="Make the output verbose", action="store_true")
parser.add_argument("word", help="Input word", action="store", type=lambda s: unicode(s,'utf-8'))
parser.add_argument("-l", help="Input language (en or heb)", action="store", default="heb")

def printv(arg1):
    """
    Verbose print
    """
    if VERBOSE:
        print(arg1)


def heb2en(url):
    result=os.popen(
    'curl -s '+url+'  |\
    grep -B 4 "default_trans" |\
    sed "\
    /class.\+diber/d ; \
    s/sound.trans.*$//g; s/\s\+/ /g; s/^\s\+//g ; \
    s/<\/div>.*$//g ; \
    s/<\/div>.*$//g ; \
    /--/d ; \
    /^$/d ; \
    /translation_en/d ; \
    s/<.*default_trans.*>// ; \
    s/^<span.*word\\">//; \
    s/<\/span>// ; \
    " \
    '
    ).read()
    print(result)



if __name__=="__main__" :
    # Parse arguments
    args = parser.parse_args()
    if args.verbose:
        print("Making the command verbose...")
        VERBOSE=True
    else:
        VERBOSE=False

    word=args.word
    printv(word)
    word_urlencoded=urllib.quote_plus(word.encode("utf-8"))
    url="www.morfix.co.il/"+word_urlencoded
    printv(url)

    if args.l=="heb":
        heb2en(url)
    else:
        heb2en(url)


# vim:ft=python:
