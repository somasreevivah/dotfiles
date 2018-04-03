#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import logging
import argparse
import math


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description="Tabij to Gb"
    )

    parser.add_argument("fockvectors",
        help="Number of fock vectors",
        type=int,
        action="store"
    )

    parser.add_argument("--no",
        help="Number of occupied orbitals",
        type=int,
        default=3,
        action="store"
    )

    parser.add_argument("--nv",
        help="Number of virtual orbitals",
        type=int,
        default=3,
        action="store"
    )

    parser.add_argument("-t",
        help="Truncation level",
        type=int,
        default=2,
        action="store"
    )

    double_bytes = 8
    args = parser.parse_args()
    r_n = args.fockvectors * sum(
        pow(args.no, 2*level) * pow(args.nv, 2*level)
        for level in range(1, args.t+1)
    )
    print('No        :    {}'.format(args.no))
    print('Nv        :    {}'.format(args.nv))
    print('Trunc.    :    {}'.format(args.t))
    print('#Vectors  :    {}'.format(args.fockvectors))
    print('R^n       :    {}'.format(r_n))
    print('R^n (B)   :    {}'.format(double_bytes * r_n))
    print('R^n (KiB) :    {}'.format(double_bytes * r_n / pow(2.0, 10)))
    print('R^n (MiB) :    {}'.format(double_bytes * r_n / pow(2.0, 20)))
    print('R^n (GiB) :    {}'.format(double_bytes * r_n / pow(2.0, 30)))
    print('R^n (TiB) :    {}'.format(double_bytes * r_n / pow(2.0, 40)))
    print('R^n (PiB) :    {}'.format(double_bytes * r_n / pow(2.0, 50)))
    print('R^n (EiB) :    {}'.format(double_bytes * r_n / pow(2.0, 60)))

#vim-run: python % 3
