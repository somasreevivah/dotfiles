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
    """TODO: Docstring for download.

    :url: TODO
    :returns: TODO

    """
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
        song_path = folder+"/%s_%s.mp3"%(track_num, title.replace(" ", "-"))
        url = "https:"+track.get("file").get("mp3-128")
        print("%s. %s (%s)" % (
            track_num,
            title,
            url
            ))
        if not os.path.exists(song_path):
            print("\tDownloading....")
            fd = open(song_path, "wb+")
            fd.write(urllib.request.urlopen(url).read())
            fd.close()
        print("\t* Setting mp3 metadata...")
        audio_file = eyed3.load(song_path)
        audio_file.initTag()
        print("\t\t - artist")
        audio_file.tag.artist = unicode(artist)
        print("\t\t - album")
        audio_file.tag.album = unicode(album)
        print("\t\t - title")
        audio_file.tag.title = unicode(title)
        print("\t\t - track_num")
        audio_file.tag.track_num = track_num
        audio_file.tag.save()

if __name__ == "__main__":
    urls = sys.argv[1:]
    for url in urls:
        download(url)

#vim-run: python % https://kennelpanic.bandcamp.com/album/the-johnny-silver-ep
