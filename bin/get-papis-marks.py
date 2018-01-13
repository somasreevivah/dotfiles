#!/usr/bin/env python

import yaml
from argparse import ArgumentParser
from PyPDF2 import PdfFileMerger

def bookmarks_to_list(blist, level=0):
    results = []
    for b in blist:
        new = {}
        if isinstance(b, list):
            results += bookmarks_to_list(b, level+1)
        else:
            new["title"] = b.raw_get( '/Title' )
            new["page"] = b.raw_get( '/Page' )
            new["level"] = level
            results.append(new)
    return results


def list_to_papis_yaml(blist):
    return [
        {
            'name': '  '*d['level'] + d['title'],
            'value': str(d['page'])
        } for d in blist
    ]


if __name__ == '__main__':

    ap = ArgumentParser()
    ap.add_argument('pdf', help='the input PDF')

    pdf_path = ap.parse_args().pdf

    output_pdf = PdfFileMerger()

    with open(pdf_path, 'rb') as pdf_file:
        output_pdf.merge(position=0, fileobj=pdf_file)

    bookmarks = list_to_papis_yaml(
        bookmarks_to_list(output_pdf.bookmarks)
    )
    print(
        yaml.dump(
            bookmarks,
            allow_unicode=True,
            default_flow_style=False
        )
    )

# vim-run: python3 % libc.pdf
