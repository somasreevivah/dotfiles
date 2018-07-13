#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author: Alejandro Gallo.
# License: 2017, GPLv3.
# License: 2018, GPLv3.
# Email: aamsgallo@gmail.com
"""
Basically this program is replaces the functionality of rofi

    rofi -show combi

It acts as an program launcher and program jumper.
"""

import json
import os
import sys
import copy
import itertools
import re
import subprocess


def string_to_node(string):
    return {
        'name': string,
    }

def get_local_options():
    path = os.path.expanduser(
        "~/.config/i3-window-jumper/config.json"
    )
    if os.path.exists(path):
        import json
        print('Sourcing ' + path)
        return json.load(open(path))
    else:
        return []

def node_to_dmenustring(node):
    """Convert a i3 node into a text representable object.
    """
    dmenu_text = ""
    if node.get('urgent'):
        dmenu_text += '!'
    if node.get('marks'):
        marks = ''.join(["'" + m for m in node.get('marks')])
        dmenu_text += '[%s]' % (marks)
    if node.get('mark'):
        dmenu_text += '[\'%s]' % node.get('mark')
    dmenu_text += node.get('name')
    if node.get('window_properties'):
        dmenu_text += ' :: '
        dmenu_text += node.get('window_properties').get('class')
        dmenu_text = dmenu_text
    elif node.get('type') == 'workspace':
        dmenu_text = '\u25a6 workspace ' + dmenu_text
    elif node.get('icon'):
        dmenu_text = node.get('icon') + ' ' + dmenu_text
    else:
        dmenu_text = '\u2623 ' + dmenu_text
    return dmenu_text


def dmenu_path():
    """dmenu_path wrapper in python
    """
    proc = subprocess.Popen(
        ["dmenu_path"],
        stdout=subprocess.PIPE
    )
    stdout, stderr = proc.communicate()
    return stdout.decode('utf8').split('\n')


def dmenu(nodes):
    """dmenu wrapper in python
    """
    dmenu_text = ""
    for node in nodes:
        node['dmenu_text'] = node_to_dmenustring(node)
    dmenu_text = "\n".join(node.get('dmenu_text') for node in nodes)
    proc = subprocess.Popen(
        [
            "dmenu",
            "-b",
            "-l", "10",
            "-i",
            "-fn", "monospace-14",
            "-nb", "#000000",
            "-nf", "#55ff55",
            "-sb", "#005500",
            "-sf", "#f0f0f0"
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE
    )
    stdout, stderr = proc.communicate(dmenu_text.encode('utf8'))
    selected = stdout.decode()
    print('String: ', selected)
    if not selected:
        print('None selected')
        return None
    for node in nodes:
        if node.get('dmenu_text') == selected.strip():
            print('Node selected', node)
            return node
    return selected


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
                    [get_all_nodes(d)
                        for d in dictionary.get("floating_nodes")]
                ))
        else:
            return [dictionary]


def main():

    tree = json.load(os.popen('i3-msg -t get_tree'))

    # print(json.dumps(tree, indent=2))

    nodes = get_all_nodes(tree)
    apps = [
        node
        for node in nodes
        if (node.get('window') is not None or node.get('type') == 'workspace')
        and not re.match(r"i3bar for output", str(node.get('name')))
    ]

    apps += get_local_options()
    apps += [string_to_node(program) for program in dmenu_path()]

    app = dmenu(apps)

    print(app)

    if isinstance(app, str):
        app = string_to_node(app)
    elif app is None:
        sys.exit(0)

    print(app)
    if app.get('window'):
        print('Window id', app.get('window'))
        os.popen("i3-msg '[id=%s]' focus" % app.get('window')).read()
    elif app.get('type') == 'workspace':
        os.popen("i3-msg workspace %s" % app.get('name')).read()
    else:
        cmd = app.get('run') if app.get('run') else app.get('name')
        print('Opening program ', cmd)
        subprocess.Popen(
            cmd.split(" "),
            stdin=None, stdout=None, stderr=None, 
            shell=False, close_fds=True
        )


if __name__ == "__main__":
    main()
