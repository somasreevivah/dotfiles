#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import pdfminer.pdfparser
import pdfminer.pdfdocument
import sys


fd = open(sys.argv[1], "rb")
parsed = pdfminer.pdfparser.PDFParser(fd)
doc = pdfminer.pdfdocument.PDFDocument(parsed)


for info in doc.info:
    for key in info:
        print(key, info[key])



#vim-run: python % ~/Documents/papers/dmrg/2002-Garnet-Kin-Lic-Chan-and-Martin-Head-Gordon-Highly-correlated-calculations-with-a-polynomial-cost-algorithm:-A-study-of-the-density-matrix-renormalization-group/document.pdf
#vim-run: ipython -i %
