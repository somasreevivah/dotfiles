#! /usr/bin/env python3
# -*- coding: utf-8 -*-


import urllib.request
import re
import json
import os
import sys

# url = "https://nango.bandcamp.com/releases"
url = sys.argv[1]

data = urllib.request.urlopen(url).read().decode('utf-8')
artist = re.match(r"(.*).bandcamp.com.*", url).group(1)\
        .replace("https://","")\
        .replace("//","")
print("Artist: %s" % artist)

for m in re.findall(r".*trackinfo:\s*(\[.*\]).*", data):
    tracks = json.loads(m)

if not os.path.exists(artist):
    print("Creating dir %s" % artist)
    os.mkdir(artist, mode=0o777)

for track in tracks:
    title = track.get("title")
    track_num = track.get("track_num")
    url = "https:"+track.get("file").get("mp3-128")
    print("%s. %s (%s)" % (
        track_num,
        title,
        url
        ))
    print("\tDownloading....")
    fd = open(artist+"/%s_%s.mp3"%(track_num, title.replace(" ", "-")), "wb+")
    fd.write(urllib.request.urlopen(url).read())
    fd.close()

