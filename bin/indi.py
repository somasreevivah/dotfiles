#! /usr/bin/env python3
# -*- coding: utf-8 -*-
"""
>>> a = VerticalReflexion() % HorizontalReflexion()
>>> a.__mul__('abcd')
'dcba'
>>> a * 'vovo'
'ovov'
"""
import itertools
import os
import sys


class GroupOperation(object):
    """
    >>> GroupOperation() * 'asdf'
    """
    mul_method = lambda self, string: None

    def __init__(self, name=""):
        self.name = name

    def __mod__(self, other):
        result = GroupOperation()
        result.name = self.name + '%' + other.name
        result.mul_method = lambda string: self * ( other * string )
        return result

    def __mul__(self, string):
        return self.mul_method(string)

    def __repr__(self):
        return self.name or 'GroupOperation'


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
        middle = int(len(string)/2)
        middle_middle = int(middle/2)
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
        middle = int(len(string)/2)
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
        middle = int(len(string)/2)
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
        middle = int(len(string)/2)
        return string[middle:][0] + string[0:middle][1:] \
            + string[0:middle][0] + string[middle:][1:]


def get_orbit(string, group):
    return { g * string for g in group }


def spans_all(base, target_space, group):
    return target_space <= { g * b for g in group for b in base}


def get_representation(element, base, group):
    for g in group:
        for b in base:
            if element == g * b:
                return (g, b)


e = Identity('e')
h = HorizontalReflexion('h')
v = VerticalReflexion('v')
hl = HorizontalReflexionLeft('hl')
vt = VerticalReflexionTop('vt')
vb = h % vt % h
vb.name = 'vb'
hr = v % hl % v
hr.name = 'hr'

G_complex = [e, h, v, h % v]
G_real = G_complex + [hl, hr, vt, vb]

SPACE = { "".join(d) for d in itertools.product('vo', repeat=4) }


CANDIDATES = {
    "oovv",
    "ovoo",
    "ovov",
    "voov",
    "ovvv",
}

antisymmetric = False
G = G_real
G = G_complex
min_dim = 2
target_space = CANDIDATES
target_space = SPACE

model_space = SPACE - target_space

print('G                 ', G)
print('total_space  len: ', len(SPACE))
print('model_space  len: ', len(model_space))
print('target_space len: ', len(target_space))

if len(model_space) == 0:
    print('Model space is too small')
    sys.exit(1)

if antisymmetric:
    print('Expanding target space for antisimmetry')
    target_space = target_space | {vb * c for c in target_space}
    print('target_space len: ', len(target_space))


try:
    for dimension in range(min_dim, 2**len(model_space) + 1):
        print('Dimension: %s' % dimension)
        bases = [ set(base)
            for base in itertools.combinations(model_space, dimension)
        ]
        print(max([len(b) for b in bases]))
        for base in bases:
            # print(list(bases))
            if spans_all(set(base), target_space, G):
                print('Base   ' , base, 'expands')
                print('G*Base ' , {g * b for g in G for b in base})
                print('Target ' , target_space)
                raise Exception('Done here')
except:
    pass

for element in target_space:
    print('%s = %s * %s' % (element, *get_representation(element, base, G)))


# vim-run: python3 -m doctest %
# vim-run: flake8 %
# vim-run: python %
