#! /usr/bin/env python2
# -*- coding: utf-8 -*-



############################
#  COMMAND LINE INTERFACE  #
############################
import argparse
import sys

parser = argparse.ArgumentParser(description="Get a list of nearest neighbours for the number of an atom")

parser.add_argument("-v", "--verbose", help="Make the output verbose", action="store_true")
parser.add_argument("-f", help="Input file.", action="store")
parser.add_argument("-n", help="Atom number", action="store", type=int)

def printv(arg1):
    """
    Verbose print
    """
    if VERBOSE:
        print(arg1)

class POSCAR(object):

    def __init__(self):
        self.comment=""
        self.basis=[]
        self.constant=0
        self.atoms_header=[]
        self.atoms_number_header=[]
        self.atoms=[]
        self.mode=False
    def getAtomSymbol(self, atom_number):
        buffer=0
        for j, atoms in enumerate(self.atoms_number_header):
            buffer+=atoms
            if atom_number<=buffer:
                return self.atoms_header[j]
    def getAtomCoord(self, atom_number):
        """TODO: Docstring for getAtomCoord.

        :atom_number: TODO
        :returns: TODO

        """
        if atom_number>self.numberOfAtoms():
            raise Exception("There are only %s atoms, please choose a number between 1 and %s"%(self.numberOfAtoms(), self.numberOfAtoms()))
            sys.exit(1)
        coords=self.atoms[atom_number-1]
        if self.mode[0] in ["C","c"]:
            return vec_times_scalar(coords,self.constant)
        else:
            return [self.basis[0][i]*coords[i] +self.basis[1][i]*coords[i] +self.basis[2][i]*coords[i] for i in range(3)]

    def numberOfAtoms(self):
        return int(sum(self.atoms_number_header))
    def echo(self):
        print("%s  %s"%("comment",self.comment))
        print("%s  %s"%("basis",self.basis))
        print("%s  %s"%("constant",self.constant))
        print("%s  %s"%("atoms_header",self.atoms_header))
        print("%s  %s"%("atoms_number_header",self.atoms_number_header))
        print("%s  %s"%("Atoms Number",self.numberOfAtoms()))
        print("%s  %s"%("Mode",self.mode))
        print("%s  %s"%("Atoms",self.atoms))

def parsePoscar(filepath):
    """TODO: Docstring for parsePoscar.

    :filepath: TODO
    :returns: TODO

    """
    import re
    poscar = POSCAR()
    with open(filepath, "r") as f:
        for j,line in enumerate(f):
            line_number=j+1
            if line_number == 1:
                poscar.comment=line
            elif line_number == 2:
                poscar.constant = float(line)
            elif 5>=line_number >= 3:
                poscar.basis.append([float(i) for i in re.sub(r"\s+"," ", line).split()])
            elif line_number == 6:
                poscar.atoms_header = re.sub(r"\s+"," ", line).split()
            elif line_number == 7:
                poscar.atoms_number_header = [float(x) for x in re.sub(r"\s+"," ", line).split()]
            elif line_number == 8:
                poscar.mode=line
            else:
                poscar.atoms.append([float(i) for i in re.sub(r"\s+"," ", line).split()])
    return poscar

def vec_times_scalar(vec, scalar):
    return [scalar*x for x in vec]
def norm3d (vector):
    """TODO: Docstring for 3d.

    :3dvector: TODO
    :returns: TODO

    """
    import math
    return math.sqrt( sum([x**2 for x in vector]))
def dist3d (vec1,vec2):
    """TODO: Docstring for 3ddist.

    :arg1: TODO
    :returns: TODO

    """
    diff = []
    for i in range(len(vec1)):
        diff.append(vec1[i]-vec2[i])
    return norm3d(diff)
def calculateIncrementalEntfernteAtoms(poscar,atomNumber):
    """TODO: Docstring for calculateIncrementalEntfernteAtoms.

    :atomNumber: TODO
    :returns: TODO

    """
    base_coord = poscar.getAtomCoord(atomNumber)
    all_distances= []
    ordered_distances= []
    for atom_number in range(1,int(poscar.numberOfAtoms()+1)):
        # print(atom_number)
        distance = dist3d(base_coord, poscar.getAtomCoord(atom_number))
        all_distances.append([atom_number, distance])
    sweep_times=len(all_distances)
    for j in range(sweep_times):
        bottle_index=0
        bottle=all_distances[bottle_index]
        for ind,element in enumerate(all_distances):
            if element[1]<bottle[1]:
                bottle = element
                bottle_index=ind
        ordered_distances.append(bottle)
        all_distances.pop(bottle_index)

    return ordered_distances





if __name__=="__main__" :
    # Parse arguments
    args = parser.parse_args()

    if args.verbose:
        print("Making the command verbose...")
        VERBOSE=True
    else:
        VERBOSE=False

    printv("Input file %s"%args.f)
    printv("Searching for atom number %s"%args.n)

    poscar=parsePoscar(args.f)
    # poscar.echo()
    ordered_distances = calculateIncrementalEntfernteAtoms(poscar,args.n)

    for item in ordered_distances:
        atom_number = item[0]
        atom_distance = item[1]
        atom_symbol = poscar.getAtomSymbol(atom_number)
        print("%s %s %s"%(atom_number, atom_symbol, atom_distance))



















# vim-run: clear;python2 %  -f POSCAR -n 14
# vim-run: python2 % -v  -f POSCAR -n 14
