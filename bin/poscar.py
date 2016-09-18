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
    def getAtomSymbols(self):
        return self.atoms_header
    def getScaledBasis(self):
        if self.isCartesian():
            return [[self.constant, 0,0],[0,self.constant,0],[0,0,self.constant]]
        else:
            vec0 = [self.constant * x for x in [ v for v in self.basis[0] ] ]
            vec1 = [self.constant * x for x in [ v for v in self.basis[1] ] ]
            vec2 = [self.constant * x for x in [ v for v in self.basis[2] ] ]
            return [vec0,vec1,vec2]
    def getCoordinates(self, atom_number):
        if atom_number>self.getNumberOfAtoms():
            raise Exception("There are only %s atoms, please choose a number between \
                    1 and %s"%(self.getNumberOfAtoms(), self.getNumberOfAtoms()))
            sys.exit(1)
        coords=self.atoms[atom_number-1]
        return coords
    def getCartesian(self, atom_number):
        coords = self.getCoordinates(atom_number)
        basis  = self.getScaledBasis()
        return [basis[0][i]*coords[i] + basis[1][i]*coords[i] + basis[2][i]*coords[i] for i in range(3)]
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
    def printAsyAtoms(self, max_length = 2, min_length = 0, bond_radius = 5.9, radius_scale = 1, asy_atom="atom.asy", camera = ""):
        """
        Print asy-atoms file
        """
        print("""\
include "%s";
//import atoms;\n\n
unitsize(1cm);
//currentprojection  = perspective(1,1,1);
settings.prc       = false;
settings.render    = 10; //quality
//settings.outformat = "pdf"; //output """%(asy_atom))
        print("\n")
        print("real bond_radius = %s;"%bond_radius)
        print("real radius_scale = %s;"%radius_scale)
        print("real max_bond_dist = %s;"%max_length)
        print("real min_bond_dist = %s;"%min_length)
        print("currentlight = AtomLight;")
        if camera:
            print("\n\n")
            print(camera)

        print("\n\n")

        # Print basis vectors
        print("Basis basis = Basis(");
        basis = self.getScaledBasis()
        for j,vec in enumerate(basis):
            coma = "" if j == len(basis)-1 else ","
            print("  (%s)%s"%(str(vec).strip("[]"),coma))
        print("); //This basis has been already scaled up")

        print("\n\n")

        print("\n// - Atoms - %s1"%("{"*3))
        for i in range(1,poscar.getNumberOfAtoms()+1):
            symbol = poscar.getAtomSymbol(i)
            atom   = poscar.getCoordinates(i)
            coords = str(atom).strip("[]")
            print("Atom %s%s = Atom(\"%s\", (%s), basis = basis);"%(symbol,i, symbol, coords))
        print("// - Atoms - 1%s"%("}"*3))

        print("\n\n")
        for symbol in self.getAtomSymbols():
            print("ALL_ATOMS.drawAtom(\"%s\", draw_label = false, radius_scale = radius_scale);"%(symbol))

        print("\n\n")
        for j,symbol in enumerate(self.getAtomSymbols()):
            for i,symbol2 in enumerate(self.getAtomSymbols()):
                if j<i:
                    continue
                else:
                    print("ALL_ATOMS.drawBond(\"%s\", \"%s\", bond_radius = bond_radius, max_dist = max_bond_dist);"%(symbol, symbol2))


        print("\n\n")
        print("//vim-run: asy -batchView %\n//vim-run: asy -f pdf %")




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
    base_coord = poscar.getCartesian(atomNumber)
    all_distances= []
    ordered_distances= []
    for atom_number in range(1,int(poscar.getNumberOfAtoms()+1)):
        # print(atom_number)
        distance = dist3d(base_coord, poscar.getCartesian(atom_number))
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

    parser.add_argument("-v",
            "--verbose",
            help="Make the output verbose",
            action="store_true")
    parser.add_argument("-f",
            help="Input file.",
            action="store",
            default="POSCAR")


    SUBPARSER_HELP="For further information for every command, type in 'poscar.py <command> -h'"
    subparsers = parser.add_subparsers(help=SUBPARSER_HELP,
            metavar="command",
            dest="command")

    order_parser = subparsers.add_parser("order",
            help="Order atoms by distance")

    order_parser.add_argument("-n",
            help="Atom number",
            action="store",
            type=int)

    asy_parser = subparsers.add_parser("asy",
            help="Prepare an asy plot with the poscar atoms")
    asy_parser.add_argument(
        "--chgcar",
        help="Print volumetric data in chgcar format",
        action="store_true",
        )

    asy_parser.add_argument("-l",
            help="Minimum length",
            action="store",
            default=0,
            type=float)
    asy_parser.add_argument("-L",
            help="Maximum length",
            action="store",
            default=10000,
            type=float)
    asy_parser.add_argument("--radius-scale",
            help="Radius scale for all",
            action="store",
            default=0.5)
    asy_parser.add_argument("--bond-radius",
            help="Radius scale for all, default 2",
            action="store",
            default=5,
            type=float)
    asy_parser.add_argument("--asy-atom",
            help="Write the path to the atom.asy library to import",
            action="store",
            default="atom.asy",
            type=str
            )
    asy_parser.add_argument("--camera",
            help="Asymptote camera to initialise",
            action="store",
            default="",
            type=str)

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
        poscar.printAsyAtoms(args.L, args.l, args.bond_radius, args.radius_scale, args.asy_atom, args.camera);
    elif args.command == "order":
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
