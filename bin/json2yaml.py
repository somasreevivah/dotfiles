#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Author: Alejandro Gallo.
# License: 2018, GPLv3.
# Email: aamsgallo@gmail.com

import sys
import json
try:
    import yaml
except:
    print('Try install python yaml, pip install pyyaml')
    sys.exit(1)


import argparse


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description="Convert json into yaml"
    )

    parser.add_argument("input_file",
        help= "Input file.",
        action="store"
    )

    parser.add_argument("-o",
        help= "Output file.",
        default=None,
        action="store"
    )

    # Parse arguments
    args = parser.parse_args()

    args.o = args.input_file + '.yaml' or args.o
    with open(args.input_file) as fi:
        json_dict = json.load(fi)
        with open(args.o, 'w+') as fo:
            yaml.dump(json_dict, fo)
