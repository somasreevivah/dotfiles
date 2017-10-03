#! /usr/bin/env python3
# -*- coding: utf-8 -*-
import sets

class VerticalReflexion(object):
    def __mul__(self, string):
        """
        >>> VerticalReflexion()*'vovo'
        'ovov'
        >>> VerticalReflexion()*'abcd'
        'badc'
        """
        middle = len(string)/2
        middle_middle = middle/2
        return string[0:middle][middle_middle:] + string[0:middle][0:middle_middle] \
                + string[middle:][middle_middle:] + string[middle:][0:middle_middle]


class HorizontalReflexion(object):
    def __mul__(self, string):
        """
        >>> HorizontalReflexion()*'abcd'
        'cdab'
        >>> HorizontalReflexion()*'abcde'
        'cdeab'
        """
        middle = len(string)/2
        return string[middle:] + string[0:middle]


def orbit(string):
    result = [string]
    result.append(HorizontalReflexion() * string)
    result.append(VerticalReflexion() * string)
    result.append(HorizontalReflexion() * (VerticalReflexion() * string))
    result.append(VerticalReflexion() * (HorizontalReflexion() * string))
    return sets.Set(result)

BASE = sets.Set([
    "vvvv",
    "vovo",
    "vvoo",
    "oooo",
    "ooov",
    "vvvo",
])

CANDIDATES = sets.Set([
    "oovv",
    "ovoo",
    "ovov",
    "voov",
    "ovvv",
    "vvov",
])

for c in CANDIDATES:
    print(c)
    c_orbit = orbit(c)
    print('\t%s' % c_orbit)
    intersection = c_orbit.intersection(BASE)
    print('\t%s' % intersection)
    if len(intersection) == 0:
        print('\t\t %s No representable' % c)


#vim-run: python -m doctest %
#vim-run: python %
