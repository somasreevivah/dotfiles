#! /usr/bin/env python3
# -*- coding: utf-8 -*-
import re
import urllib.request
import string
import time
import logging
import argparse
import sys

def get_url_contents(url):
    return urllib.request.urlopen(url).read().decode('utf-8')

def aps_to_dict(content):
    data = dict()
    M = re.findall(r"Room:.*", content)
    for m in M:
        data["room"] = m
    M = re.findall(r"Monday|Tuesday|Wednesday|Thursday|Friday", content)
    for m in M:
        data["day"] = m
    M = re.findall(r"Abstract:.*", content)
    for m in M:
        data["abstract"] = m.replace("Abstract:","")
    M = re.findall(r"Session\s*\w+:.*", content)
    for m in M:
        data["session"] = m.replace("Session","")
    M = re.findall(r"Chair:.*", content)
    for m in M:
        data["chair"] = m.replace("Chair:","")
    M = re.findall(r".*AM.*", content)
    for m in M:
        data["time"] = m.replace("&nbsp;", " ").replace("&#8211;"," to ")
    for key in data.keys():
        data[key] = re.sub(r"</?\w+>", "", data[key])
        print(data[key])
    return data

def dict_to_ical(dictionary,offset=["0","0",0]):
    template = string.Template(r"""BEGIN:VEVENT
ORGANIZER;CN=$organizer
DTSTART:$dtstart
DTEND:$dtend
SUMMARY:$summary
END:VEVENT
    """)
    day = dictionary["day"]
    if day == "Monday":
        day_offset = 1
    elif day == "Tuesday":
        day_offset = 2
    elif day == "Wednesday":
        day_offset = 3
    elif day == "Thursday":
        day_offset = 4
    elif day == "Friday":
        day_offset = 5
    day = [str(p) for p in
                [offset[0], offset[1], int(offset[2]) + day_offset]]
    hours = dictionary["time"].replace(" ","").split("to")
    start_time = time.strptime(
            "%s %s %s %s"%(day[0], day[1], day[2], hours[0]),
            "%Y %m %d %I:%M%p")
    end_time = time.strptime(
            "%s %s %s %s"%(day[0], day[1], day[2], hours[1]),
            "%Y %m %d %I:%M%p")
    dtstart = time.strftime("%Y%m%dT%H%M%SZ", start_time)
    dtend = time.strftime("%Y%m%dT%H%M%SZ", end_time)
    print(dtstart)
    print(dtend)
    summary = dictionary["room"]+dictionary["abstract"]
    text = template.substitute(
        dtstart=dtstart,
        dtend=dtend,
        organizer=dictionary["chair"],
        summary=summary
    )
    return text


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
    description="Calendar extractor from urls")

    parser.add_argument("-v",
        "--verbose",
        help    = "Make the output verbose",
        default = False,
        action  = "store_true"
    )
    parser.add_argument("-f",
        help   = "Url file.",
        action = "store",
        default = ""
    )
    parser.add_argument("-o", "--out",
        help   = "out File",
        action = "store",
        default = "exported_calendar.ics"
    )
    parser.add_argument("-p", "--parser",
        help   = "Parser",
        action = "store",
        default = "aps"
    )
    parser.add_argument("--url",
        help   = "Url",
        action = "store",
        default = ""
    )
    parser.add_argument(
            "--log",
            help="Logging level",
            choices=[
                "INFO",
                "DEBUG",
                "WARNING",
                "ERROR",
                "CRITICAL"
                ],
            action="store",
            default="WARNING"
            )
    # Parse arguments
    args = parser.parse_args()
    if args.verbose:
        args.log = "DEBUG"
    logging.basicConfig(level = getattr(logging, args.log))

    if args.url:
        urls = [args.url]
    else:
        urls = open(args.f).readlines()

    outfile = args.out

    if args.parser == "aps":
        parser = aps_to_dict
    else:
        logging.error("Parser not found")
        sys.exit(1)

    outfd = open(outfile, "w+")

    outfd.write("BEGIN:VCALENDAR\nVERSION:2.0")

    for url in urls:
        data = get_url_contents(url)
        date_offset = ["2017","03",12]
        dictionary = parser(data)
        ical = dict_to_ical(dictionary, offset=date_offset)
        print(ical)
        outfd.write(ical)

    outfd.write("END:VCALENDAR")

#vim-run: clear; python3 % --url http://meetings.aps.org/Meeting/MAR17/Session/A19.3 -o qm.ical
