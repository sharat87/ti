# encoding: utf-8

from __future__ import print_function
from __future__ import unicode_literals

import re
import datetime as dt

def parse_time(timestr):

    now = dt.datetime.utcnow()
    if not timestr or timestr.strip() == 'now':
        return now

    match = re.match(r'(\d+) \s* (mins?|minutes?) \s+ ago $', timestr, re.X)
    if match is not None:
        minutes = int(match.group(1))
        return now - dt.timedelta(minutes=minutes)

    raise ValueError("Don't understand the time '" + timestr + "'")


def main():
    print(parse_time('5 mins ago'))


if __name__ == '__main__':
    main()
