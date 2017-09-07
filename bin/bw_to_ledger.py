#! /usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import re

def clean_line(line):
    """Clean read line
    """
    return line.replace('\n', '')\
               .replace('"', '').split(';')

input_file = sys.argv[1]

# print(input_file)

with open(input_file) as fd:
    lines = fd.readlines()

# print("Number of lines inside %s " % len(lines))
header = clean_line(lines[0])
dictionaries = list()
# print(header)

header = [
 'account',
 'date',
 'Valutadatum',
 'Buchungstext',
 'text',
 'Glaeubiger ID',
 'Mandatsreferenz',
 'Kundenreferenz (End-to-End)',
 'Sammlerreferenz',
 'Lastschrift Ursprungsbetrag',
 'Auslagenersatz Ruecklastschrift',
 'payee',
 'Kontonummer/IBAN',
 'BIC',
 'amount',
 'currency',
 'Info'
]

lines.pop(0)

for line in lines:
    cline = clean_line(line)
    d = dict()
    for i in range(len(header)):
        d[header[i]] = cline[i]
    # print(d)
    dictionaries.append(d)

for d in dictionaries:
    d['amount'] = float(d['amount'].replace(',','.'))
    if d['amount'] < 0:
        first = 'assets:bank:checking'
        second = 'expenses:general'
    else:
        first = 'assets:bank:checking'
        second = 'income:general'

    date = d['date'].split('.')
    d['date'] = '%s/%s/%s' %(
        date[2] if len(date[2]) > 2 else '20'+date[2], date[1], date[0]
    )

    if re.match(r"ENTGELT", d['text']):
        d['text'] = 'Salary'
        second = 'income:salary'
    elif re.match(r".*VUELING.*", d['text']):
        second = 'expenses:flight'

    print("""\
{d[date]} * {d[payee]} {d[text]}
    {first}        {d[amount]}
    {second}""".format(d=d, first=first, second=second)
    )

#vim-run: python % ~/Downloads/20170907-7421078731-umsatz.CSV >> ~/ledger.dat
#vim-run: python % ~/Downloads/20170907-7421078731-umsatz.CSV | less
