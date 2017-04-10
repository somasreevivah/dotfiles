#! /usr/bin/env python3
# -*- coding: utf-8 -*-


import urllib.request
import re
import json
import os
import sys

# url = "https://nango.bandcamp.com/releases"
url = sys.argv[1]

print("Input url %s" % url)
print("Parsing url...")

m = re.match(r"(.*).bandcamp.com.*", url)
if m:
    artist = m.group(1)\
              .replace("https://","")\
              .replace("//","")
    album = None
    folder = artist

m = re.match(r"(.*).bandcamp.com/album/(.*)", url)
if m:
    artist = m.group(1)\
              .replace("https://","")\
              .replace("//","")
    album = m.group(2)
    folder = os.path.join(artist, album)

print("Artist: %s" % artist)
if album: print("Album: %s" % album)

print("Downloading website...")
data = urllib.request.urlopen(url).read().decode('utf-8')

print("Parsing data...")
for m in re.findall(r".*trackinfo:\s*(\[.*\]).*", data):
    tracks = json.loads(m)

if not os.path.exists(folder):
    print("Creating dir %s" % folder)
    os.makedirs(folder, mode=0o777)

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
    fd = open(folder+"/%s_%s.mp3"%(track_num, title.replace(" ", "-")), "wb+")
    fd.write(urllib.request.urlopen(url).read())
    fd.close()

#vim-run: python3 % https://kennelpanic.bandcamp.com/album/the-johnny-silver-ep
