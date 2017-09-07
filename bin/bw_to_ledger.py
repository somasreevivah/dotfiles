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

header = [
    "date",
    "Auftragsart",
    "payee",
    "BLZ/BIC",
    "Kontonummer/IBAN",
    "text",
    "amount",
    "Soll/Haben"
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
    d['amount'] = float(str(d['amount']).replace(',','.'))
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

    d['title'] = d['payee'] + " " + d['text']
    d['title'] = re.sub(r"Europe S.a.r.l. .* Ihr Einkauf ", '', d['title'])
    d['title'] = re.sub(r"ALDI GMBH .*", 'ALDI', d['title'])

    print("""
{d[date]} {d[title]}
    {first}        {d[amount]}
    {second}""".format(d=d, first=first, second=second)
    )

#vim-run: python % ~/.ledger/Umsaetze-7421078731-20170123.csv | less
#vim-run: python % ~/Downloads/20170907-7421078731-umsatz.CSV >> ~/ledger.dat
