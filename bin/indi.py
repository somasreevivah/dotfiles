#! /usr/bin/env python3
# -*- coding: utf-8 -*-
"""
>>> a = VerticalReflexion() % HorizontalReflexion()
>>> a.__mul__('abcd')
'dcba'
>>> a * 'vovo'
'ovov'
"""
import sets
import itertools


class GroupOperation(object):
    """
    >>> GroupOperation() * 'asdf'
    """
    mul_method = lambda self, string: None
    def __mod__(self, other):
        result = GroupOperation()
        result.mul_method = lambda string: self * ( other * string )
        return result

    def __mul__(self, string):
        return self.mul_method(string)


class Identity(GroupOperation):
    """
    >>> Identity() * 'asdf'
    'asdf'
    """
    mul_method = lambda self, string: string


class VerticalReflexion(GroupOperation):
    def __mul__(self, string):
        """
        >>> VerticalReflexion()*'vovo'
        'ovov'
        >>> VerticalReflexion()*'abcd'
        'badc'
        """
        middle = len(string)/2
        middle_middle = middle/2
        return string[0:middle][middle_middle:] \
            + string[0:middle][0:middle_middle] \
            + string[middle:][middle_middle:] \
            + string[middle:][0:middle_middle]


class VerticalReflexionTop(GroupOperation):
    def __mul__(self, string):
        """
        >>> VerticalReflexionTop() * 'abcd'
        'bacd'
        >>> HorizontalReflexion() % VerticalReflexionTop() % HorizontalReflexion() * 'abcd'
        'abdc'
        """
        middle = len(string)/2
        return string[0:middle][1] \
            + string[0:middle][0] \
            + string[middle:]


class HorizontalReflexion(GroupOperation):
    def __mul__(self, string):
        """
        >>> HorizontalReflexion()*'abcd'
        'cdab'
        >>> HorizontalReflexion()*'abcde'
        'cdeab'
        """
        middle = len(string)/2
        return string[middle:] + string[0:middle]


class HorizontalReflexionLeft(GroupOperation):
    def __mul__(self, string):
        """
        >>> HorizontalReflexionLeft()*'abcd'
        'cbad'
        >>> HorizontalReflexionLeft()*'abcdef'
        'dbcaef'
        >>> HorizontalReflexionLeft()*'ab'
        'ba'
        """
        middle = len(string)/2
        return string[middle:][0] + string[0:middle][1:] \
            + string[0:middle][0] + string[middle:][1:]


def orbit(string):
    result = [string]
    result.append(HorizontalReflexion() * string)
    result.append(VerticalReflexion() * string)
    result.append(HorizontalReflexion() * (VerticalReflexion() * string))
    result.append(VerticalReflexion() * (HorizontalReflexion() * string))
    return sets.Set(result)


e = Identity()
h = HorizontalReflexion()
v = VerticalReflexion()

G_complex = [e, h, v, h % v]

print(G_complex)

SPACE = ["".join(d) for d in itertools.product('vo', repeat=4)]

print(SPACE)

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


# vim-run: python -m doctest %
# vim-run: flake8 %
# vim-run: python %
