#!/usr/bin/env python
# encoding: utf-8

from __future__ import print_function

import os, os.path as p
from collections import namedtuple as nt
import re
import datetime as dt

Activity = nt('Activity', 'name on_time fin_time tags notes')

def get_sheet_content(sheet_file):

    lines = []

    with open(sheet_file) as f:
        for line in f:
            line = line[:-1]
            lines.append('' if line.isspace() else line)

    return '\n'.join(lines)

def parse_time(timestr):
    return dt.datetime.strptime(timestr,
            '%a %b %d %H:%M:%S %Z %Y')

def parse_activity(content):
    lines = content.splitlines()
    project_line = lines[0].strip()

    match = re.match(r'^ (.+) \s+ \[(.+)\] \s to \s \[(.+)\] (.*) $',
            project_line, re.X)

    if match is None:
        return None

    groups = match.groups()
    project_name = groups[0]

    on_time = parse_time(groups[1])
    fin_time = parse_time(groups[2])

    tags = [t.lstrip('#') for t in groups[3].strip().split()]
    notes = [l.strip() for l in lines[1:]]

    activity = Activity(project_name, on_time, fin_time, tags, notes)

    return activity

def read_activities(sheet_file):
    return [parse_activity(s.strip()) for s in
            get_sheet_content(sheet_file).split('\n\n')
            if s]

def age(from_date, since_date=None, target_tz=None, include_seconds=False):
    '''Returns the age as a string
    Taken from http://www.siafoo.net/snippet/89'''

    if since_date is None:
        since_date = dt.now(target_tz)

    distance_in_time = since_date - from_date
    distance_in_seconds = int(round(abs(distance_in_time.days * 86400 + distance_in_time.seconds)))
    distance_in_minutes = int(round(distance_in_seconds/60))

    if distance_in_minutes <= 1:
        if include_seconds:
            for remainder in [5, 10, 20]:
                if distance_in_seconds < remainder:
                    return "less than %s seconds" % remainder
            if distance_in_seconds < 40:
                return "half a minute"
            elif distance_in_seconds < 60:
                return "less than a minute"
            else:
                return "1 minute"
        else:
            if distance_in_minutes == 0:
                return "less than a minute"
            else:
                return "1 minute"
    elif distance_in_minutes < 45:
        return "%s minutes" % distance_in_minutes
    elif distance_in_minutes < 90:
        return "about 1 hour"
    elif distance_in_minutes < 1440:
        return "about %d hours" % (round(distance_in_minutes / 60.0))
    elif distance_in_minutes < 2880:
        return "1 day"
    elif distance_in_minutes < 43220:
        return "%d days" % (round(distance_in_minutes / 1440))
    elif distance_in_minutes < 86400:
        return "about 1 month"
    elif distance_in_minutes < 525600:
        return "%d months" % (round(distance_in_minutes / 43200))
    elif distance_in_minutes < 1051200:
        return "about 1 year"
    else:
        return "over %d years" % (round(distance_in_minutes / 525600))

def main():
    sheet_file = p.expanduser(os.getenv('SHEET_FILE', '~/.ti-sheet'))
    activities = read_activities(sheet_file)
    print(activities)

if __name__ == '__main__':
    main()
