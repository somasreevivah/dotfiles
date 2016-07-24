#! /usr/bin/env python2
# -*- coding: utf-8 -*-


import argparse
import sys
import re
import numpy

#  Helper functions {{{1  #
###########################

def printv(arg1):
    """
    Verbose print
    """
    if VERBOSE:
        print(arg1)



#  Main classes {{{1  #

class POSCAR(object):
    def __init__(self):
        self.comment=""
        self.basis=[]
        self.constant=0
        self.atoms_header=[]
        self.atoms_number_header=[]
        self.atoms=[]
        self.mode=False
        self.fd=None
    def getAtomSymbol(self, atom_number):
        buffer=0
        for j, atoms in enumerate(self.atoms_number_header):
            buffer+=atoms
            if atom_number<=buffer:
                return self.atoms_header[j]
    def getCellVolume(self):
        main_volume=numpy.linalg.det(self.basis)
        if self.isCartesian():
            return main_volume*self.constant
        else:
            return main_volume
    def getScaledBasis(self):
        if self.isCartesian():
            return [[self.constant, 0,0],[0,self.constant,0],[0,0,self.constant]]
        else:
            vec0 = [self.constant * x for x in [ v for v in self.basis[0] ] ]
            vec1 = [self.constant * x for x in [ v for v in self.basis[1] ] ]
            vec2 = [self.constant * x for x in [ v for v in self.basis[2] ] ]
            return [vec0,vec1,vec2]
    def getAtomCoord(self, atom_number):
        if atom_number>self.getNumberOfAtoms():
            raise Exception("There are only %s atoms, please choose a number between 1 and %s"%(self.getNumberOfAtoms(), self.getNumberOfAtoms()))
            sys.exit(1)
        coords=self.atoms[atom_number-1]
        basis = self.getScaledBasis()
        # print(basis)
        return [basis[0][i]*coords[i] + basis[1][i]*coords[i] + basis[2][i]*coords[i] for i in range(3)]
        # if self.isCartesian():
            # return vec_times_scalar(coords,self.constant)
        # else:
            # vec0 = vec_times_scalar(self.basis[0], self.constant/norm3d(self.basis[0]))
            # vec1 = vec_times_scalar(self.basis[1], self.constant/norm3d(self.basis[1]))
            # vec2 = vec_times_scalar(self.basis[2], self.constant/norm3d(self.basis[2]))
            # vec0 = vec_times_scalar(self.basis[0], self.constant**2)
            # vec1 = vec_times_scalar(self.basis[1], self.constant**2)
            # vec2 = vec_times_scalar(self.basis[2], self.constant**2)
            # vec0 = vec_times_scalar(self.basis[0], self.constant)
            # vec1 = vec_times_scalar(self.basis[1], self.constant)
            # vec2 = vec_times_scalar(self.basis[2], self.constant)
            # vec0 = vec_times_scalar(self.basis[0], 1)
            # vec1 = vec_times_scalar(self.basis[1], 1)
            # vec2 = vec_times_scalar(self.basis[2], 1)
            # return [vec0[i]*coords[i] +vec1[i]*coords[i] + vec2[i]*coords[i] for i in range(3)]
    def isCartesian(self):
        return self.mode[0] in "CcKk"
    def getNumberOfAtoms(self):
        return int(sum(self.atoms_number_header))
    def echo(self):
        print("POSCAR")
        print("======")
        print("%s  %s"%("comment",self.comment))
        print("%s  %s"%("basis",self.basis))
        print("%s  %s"%("constant",self.constant))
        print("%s  %s"%("atoms_header",self.atoms_header))
        print("%s  %s"%("atoms_number_header",self.atoms_number_header))
        print("%s  %s"%("Atoms Number",self.getNumberOfAtoms()))
        print("%s  %s"%("Mode",self.mode))
        print("%s  %s"%("Atoms",self.atoms))

class CHGCAR(POSCAR):
    def __init__(self,poscar):
        """TODO: to be defined1. """
        POSCAR.__init__(self)
        self.comment=poscar.comment
        self.basis=poscar.basis
        self.constant=poscar.constant
        self.atoms_header=poscar.atoms_header
        self.atoms_number_header=poscar.atoms_number_header
        self.atoms=poscar.atoms
        self.mode=poscar.mode
        self.fd=poscar.fd

        self.data = []
        self.partition = []


#  Parsing {{{1  #
##################

def parsePoscar(filepath):
    f         = open(filepath, "r")
    poscar    = POSCAR()
    poscar.fd = f
    for j,line in enumerate(f):
        line_number=j+1
        if re.match(r"^\s*$",line):
            continue
        if line_number == 1:
            poscar.comment=line
        elif line_number == 2:
            poscar.constant = float(line)
        elif 5>=line_number >= 3:
            poscar.basis.append([float(i) for i in re.sub(r"\s+"," ", line).split()])
        elif line_number == 6:
            poscar.atoms_header = re.sub(r"\s+"," ", line).split()
        elif line_number == 7:
            poscar.atoms_number_header = [int(x) for x in re.sub(r"\s+"," ", line).split()]
        elif line_number == 8:
            poscar.mode=line
        elif poscar.getNumberOfAtoms()+9>=line_number>=9:
            poscar.atoms.append([float(i) for i in re.sub(r"\s+"," ", line).split()])
        if line_number > poscar.getNumberOfAtoms()+9:
            break
    return poscar

def parseChgcar(poscar):
    """
    Normally chgcar files bear inside POSCAR information too.
    """
    printv("Parsing chgcar")
    chgcar = CHGCAR(poscar)
    f      = chgcar.fd
    f.seek(9)
    chgcar_part=False
    chgcgar_begin=0
    for j,line in enumerate(f):
        if re.match(r"^\s*$",line):
            chgcar_part=True
            chgcar_begin=j
            continue
        if not chgcar_part:
            continue
        chgcar_line=j-chgcar_begin
        # print(chgcar_line)
        if chgcar_line == 1:
            chgcar.partition = [int(x) for x in re.sub(r"\s+"," ", line).split()]
        elif chgcar_line>1:
            chgcar.data+=[float(x) for x in re.sub(r"\s+"," ", line).split()]
    # open("chgcar.text","w+").write(str(chgcar.data))
    return chgcar


#  Vector operations {{{1  #
############################

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
    for atom_number in range(1,int(poscar.getNumberOfAtoms()+1)):
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



#  Main {{{1  #
###############

if __name__=="__main__" :

    #  CLI parser {{{1  #
    #####################
    parser = argparse.ArgumentParser(description="Get a list of nearest neighbours for the number of an atom")

    parser.add_argument("-v", "--verbose", help="Make the output verbose", action="store_true")
    parser.add_argument("-f", help="Input file.", action="store", default="POSCAR")
    parser.add_argument("-n", help="Atom number", action="store", type=int)


    SUBPARSER_HELP="For further information for every command, type in 'poscar.py <command> -h'"
    subparsers = parser.add_subparsers(help=SUBPARSER_HELP, metavar="command", dest="command")

    asy_parser = subparsers.add_parser("asy", help="Prepare an asy plot with the poscar atoms")
    asy_parser.add_argument(
    "--chgcar",
    help="Print volumetric data in chgcar format",
    action="store_true",
    )

    asy_parser.add_argument("-l", help="Minimum length", action="store", default=0, type=float)
    asy_parser.add_argument("-L", help="Maximum length", action="store", default=10000, type=float)
    asy_parser.add_argument("--radius-scale", help="Radius scale for all", action="store", default=0.5)
    asy_parser.add_argument("--bond-radius", help="Radius scale for all, default 2", action="store", default=5, type=float)
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
    if  VERBOSE:
        poscar.echo()


    #  asy part {{{1  #
    ###################

    if args.command == "asy":
        # print("//! /usr/bin/env asy -batchView")
        print("""\
import atoms;
unitsize(1cm);
//currentprojection  = perspective(1,1,1);
settings.prc       = false;
settings.render    = 10; //quality
//settings.outformat = "pdf"; //output """)
        min_length = args.l
        max_length = args.L
        print("real bond_radius = %s;"%args.bond_radius)
        print("real radius_scale = %s;"%args.radius_scale)
        print("real max_bond_dist = %s;"%max_length)
        print("real min_bond_dist = %s;"%min_length)

        print("\n// - Atoms - {{{1")
        for i in range(poscar.getNumberOfAtoms()+1):
            symbol = poscar.getAtomSymbol(i)
            atom   = poscar.getAtomCoord(i)
            coords = str(atom).strip("[]")
            print("Atom ATOM_%s = Atom(\"%s\", (%s));"%(i, symbol, coords))
        print("\n// - Atoms - 1}}}")

        # draw atomic bonds
        print("\n// - Atom drawing - {{{1")
        for i in range(1,poscar.getNumberOfAtoms()+1):
            print("ATOM_%s.draw(radius_scale = radius_scale);"%(i))
        print("\n// - Atoms drawing - 1}}}")

        print("\n// - Bonds - {{{1")
        for i in range(1,poscar.getNumberOfAtoms()+1):
            for j in range(i+1, poscar.getNumberOfAtoms()+1):
                atom_pos_1 = poscar.getAtomCoord(i)
                atom_pos_2 = poscar.getAtomCoord(j)
                distance = dist3d(atom_pos_1, atom_pos_2)
                if min_length<= distance and distance <= max_length:
                    print("// distance: "+str(distance))
                    print("Bond(ATOM_%s, ATOM_%s).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);"%(i,j))
        print("\n// - Bonds - 1}}}")
        if args.chgcar:
            chgcar = parseChgcar(poscar)
            nx = chgcar.partition[0]
            ny = chgcar.partition[1]
            nz = chgcar.partition[2]
    #  normal mode {{{1  #
    ######################
    else:
        ordered_distances = calculateIncrementalEntfernteAtoms(poscar,args.n)
        for item in ordered_distances:
            atom_number = item[0]
            atom_distance = item[1]
            atom_symbol = poscar.getAtomSymbol(atom_number)
            print("%s %s %s"%(atom_number, atom_symbol, atom_distance))


















#  VIMRUN {{{1  #
#################


# vim-run: poscar.py -v -f contcar__si_minux_definitiv_1 asy | less
# vim-run: poscar.py -v -f poscar__si_minux_definitiv_1 asy | less
# vim-run: poscar.py -v -f CHGCAR asy --chgcar -L 0.1
# vim-run: poscar.py -f POSCAR asy -L 1.2 --radius-scale 0.2 --bond-radius 3 > siv.asy
# vim-run: clear;python2 %  -f POSCAR -n 14
# vim-run: python2 % -v  -f POSCAR -n 14
