#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import json
import os
import copy
import itertools
import re
import subprocess

def dmenu(nodes):
    dmenu_text = ""
    for node in nodes:
        dmenu_text += node.get('window_properties').get('class')
        dmenu_text += ' :: '
        dmenu_text += node.get('name')
        dmenu_text += '\n'
    proc = subprocess.Popen(
        [
        "dmenu",
        "-b",
        "-l", "10",
        "-i",
        "-fn", "fixed-14",
        "-nb", "#000000",
        "-nf", "#55ff55",
        "-sb", "#c0c0c0",
        "-sf", "#000000"
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE
    )
    stdout, stderr = proc.communicate(dmenu_text.encode('ascii'))
    selected = stdout.decode()
    print('String: ', selected)
    if not selected:
        print('None selected')
        return None
    for node in nodes:
        if re.match(r'.*'+node.get('name')+r'.*', selected.strip()):
            print('Node selected', node)
            return node
    return None


def get_all_nodes(dictionary):
    if isinstance(dictionary, dict):
        if 'nodes' in dictionary.keys():
            new_node = copy.deepcopy(dictionary)
            del new_node["nodes"]
            del new_node["floating_nodes"]
            return [new_node] +\
                list(itertools.chain.from_iterable(
                    [get_all_nodes(d) for d in dictionary.get("nodes")]
                )) + \
                list(itertools.chain.from_iterable(
                    [get_all_nodes(d) for d in dictionary.get("floating_nodes")]
                ))
        else:
            return [dictionary]

tree = json.load(os.popen('i3-msg -t get_tree'))

print(json.dumps(tree, indent=2))

nodes = get_all_nodes(tree)
apps = [
    node
    for node in nodes
    if node.get('window') is not None
    and not re.match(r"i3bar for output", str(node.get('name')))
]

app = dmenu(apps) or sys.exit(0)

print(app)
window_id = app.get('window')
print('Window id', window_id)

os.popen("i3-msg '[id=%s]' focus" % window_id).read()

#vim-run: python3 %
#vim-run: python3 % | less 
