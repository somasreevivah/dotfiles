import re
import urllib.request
import string
import time
import sys

def get_url_contents(url):
    return urllib.request.urlopen(url).read().decode('utf-8')

def to_dict(content):
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
    template = string.Template(r"""BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
ORGANIZER;CN=$organizer
DTSTART:$dtstart
DTEND:$dtend
SUMMARY:$summary
END:VEVENT
END:VCALENDAR
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


url = sys.argv[1]
outfile = sys.argv[2]


# url = "http://meetings.aps.org/Meeting/MAR17/Session/A19.1"
# url = "http://meetings.aps.org/Meeting/MAR17/Session/A19.3"
data = get_url_contents(url)
dictionary = to_dict(data)

date_offset = ["2017","03",12]
ical = dict_to_ical(dictionary, offset=date_offset)

print(ical)

open(outfile, "w+").write(ical)

#vim-run: clear; python3 % http://meetings.aps.org/Meeting/MAR17/Session/A19.3 qm.ical
