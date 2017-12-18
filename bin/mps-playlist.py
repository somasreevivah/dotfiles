#!/usr/bin/python3

import sys
import pickle
import os
from subprocess import call

path = os.path.expanduser('~/.config/mps-youtube/playlist_v2')
with open(path, 'rb') as file:
    playlists = pickle.load(file)

try:
    input_playlist = sys.argv[1]
except:
    print("Playlists: \n")
    for name, playlist in playlists.items():
        print('\n'+name + '\n' + len(name)*'-')
        for song in playlist.songs:
            print(song.length, song.ytid, song.title, sep='\t')
    sys.exit(1)

yturls = [
    'https://www.youtube.com/watch?v=' + song.ytid
    for song in playlists[input_playlist]
]

call(['mpv'] + yturls)
