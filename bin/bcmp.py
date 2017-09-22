#! /usr/bin/env python
# -*- coding: utf-8 -*-


# import urllib.request
import re
import json
import os
import sys
import eyed3
from six.moves import urllib

def download(url):
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
        data = dict()
        data["artist"] = artist
        data["album"] = album
        data["title"] = track.get("title")
        data["track_num"] = track.get("track_num")
        song_path = folder+"/%s_%s.mp3" % \
            (
                data["track_num"],
                data["title"].replace(" ", "-")
            )
        url = "https:"+track.get("file").get("mp3-128")
        print("%s. %s (%s)" % (
            data["track_num"],
            data["title"],
            url
            ))
        if not os.path.exists(song_path):
            print("\tDownloading....")
            fd = open(song_path, "wb+")
            print("\tSaving it in (%s)"%song_path)
            fd.write(urllib.request.urlopen(url).read())
            fd.close()
        else:
            print("\tUsing already downloaded file....")
        print("\t* Setting mp3 metadata...")
        try:
            audio_file = eyed3.load(unicode(song_path))
        except:
            print("Could not load song_path for eyed3")
        audio_file.initTag()
        for key in data.keys():
            if key == "track_num":
                value = int(data[key])
            else:
                try:
                    value = unicode(data[key])
                except:
                    value = "Unknown"
            if value:
                print("\t\t - %s" % key)
                setattr(audio_file.tag, key, value)
        audio_file.tag.save()

if __name__ == "__main__":
    urls = sys.argv[1:]
    for url in urls:
        download(url)

#vim-run: python % https://nango.bandcamp.com/
#vim-run: python % https://kennelpanic.bandcamp.com/album/501-bars
#vim-run: python % https://kennelpanic.bandcamp.com/album/the-johnny-silver-ep
