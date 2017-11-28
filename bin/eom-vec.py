#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys

No = int(sys.argv[1])
Nv = int(sys.argv[2])

to_B = lambda components: 64 * components / 8
to_MB = lambda components: to_B(components) / 2**10
to_GB = lambda components: to_MB(components) / 2**10

doubles_len = No**2 * Nv**2
singles_len = No*Nv
vec_len = singles_len + doubles_len

print("====")

print("No     = %s" % No)
print("Nv     = %s" % Nv)

print("====")

print("#Rai   = %s" % singles_len)
print("#Rabij = %s" % doubles_len)
print("#R     = %s" % vec_len)

print("====")

print("Rai    = %s B" % to_B(singles_len))
print("Rabij  = %s B" % to_B(doubles_len))
print("R      = %s B" % to_B(vec_len))

print("====")

print("Rai    = %s MB" % to_MB(singles_len))
print("Rabij  = %s MB" % to_MB(doubles_len))
print("R      = %s MB" % to_MB(vec_len))

print("====")

print("Rai    = %s GB" % to_GB(singles_len))
print("Rabij  = %s GB" % to_GB(doubles_len))
print("R      = %s GB" % to_GB(vec_len))

#vim-run: python % 2 32
