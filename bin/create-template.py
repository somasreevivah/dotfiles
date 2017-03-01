#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re

lines = []
variables = []

for line in sys.stdin:
    lines += [line]

for line in lines:
    for m in re.finditer(r"[$]([a-zA-Z]+)", line):
        variables += [ m.group(1) ]

variables = list(set(variables))
text = "".join(lines)

# Clean $
# /TODO
# text = re.sub(r"[$]([^a-zA-Z ])", r"$->$\1", text)

# PRINT RESULT
print(r'print(string.Template(')
print(r'r"""')
print("")
print(text)
print('""").substitute(')
for i,var in enumerate(variables):
    comma = "" if i == len(variables)-1 else ","
    print("%s = latex(%s)%s"%(var,var,comma))
print(")")
print(")")


# vim: nospell
#vim-run: echo '$hello $hello world and $\Phi$ my $name is $$ \eta $$ $world' | python %
