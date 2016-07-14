#! /usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import re

filename = "average.dat"


def printv(arg1):
    """
    Verbose print
    """
    if VERBOSE:
        print(arg1)

def integrate(points,low=False,high=False,x=0,y=1):
    integral_down = 0
    integral_up   = 0
    for j in range(len(points)-1):
        left_point    = points[j]
        right_point   = points[j+1]
        if low!=False:
            if left_point[x]<low:
                # print(left_point)
                continue
        if high!=False:
            if left_point[x]>high:
                continue
        print(left_point)
        integral_up   = (right_point[x]-left_point[x])*right_point[y]
        integral_down = (right_point[x]-left_point[x])*left_point[y]
    return integral_down

def read_data(filename):
    points=[]
    with open(filename,"r") as f:
        for line in f:
            substituted=re.sub(r"^\s+","",re.sub(r"\s+"," ",line)).strip("\n").split()
            # print(substituted)
            if len(substituted):
                points.append([float(x) for x in substituted])
        return points



parser = argparse.ArgumentParser(description="Integrate a 2d datafile")

parser.add_argument("-v", "--verbose", help="Make the output verbose", action="store_true")
parser.add_argument("-f", help="Input file.", action="store", default="average.dat")
parser.add_argument("--low", help="Low cut", action="store", type=float, default=False)
parser.add_argument("--high", help="High cut", action="store", type=float, default=False)


if __name__=="__main__" :
    # Parse arguments
    args = parser.parse_args()

    if args.verbose:
        print("Making the command verbose...")
        VERBOSE=True
    else:
        VERBOSE=False

    points=read_data(args.f)

    # printv(points)

    if args.low != False:
        printv(args.low)
    if args.high != False:
        printv(args.high)
    integral = integrate(points,low=args.low,high=args.high)

    print(integral)








# vim-run: clear;python % -v --low 12 --high 13
# vim-run: clear;python % -h

