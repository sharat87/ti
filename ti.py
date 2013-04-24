# encoding: utf-8

"""
ti is a simple and extensible time tracker for the command line.

Usage:
  ti on <project-name> [<start-time>...]
  ti fin [<start-time>...]
  ti status
  ti tag <tag>...
  ti note <note-text>...
  ti edit
  ti -h | --help
  ti version | --version

Options:
  -h --help         Show this help.
  <start-time>...   A time specification (Described further down).
  <tag>...          Tags can be made of any characters, but its probably a good
                    idea to avoid whitespace.
"""

from __future__ import print_function
from __future__ import unicode_literals

from parse_time import parse_time

from docopt import docopt
import json
from os import path
import sys

class JsonStore(object):

    def __init__(self, filename):
        self.filename = filename

    def load(self):

        if path.exists(self.filename):
            with open(self.filename) as f:
                data = json.load(f)

        else:
            data = {'work': []}

        return data

    def dump(self, data):
        with open(self.filename, 'w') as f:
            json.dump(data, f)


def action_on(args):
    data = store.load()
    work = data['work']

    if work and 'end' not in work[-1]:
        print('You are already working on ' + work[-1]['name'] +
                '. Stop it or use a different sheet.', file=sys.stderr)
        raise SystemExit(1)

    entry = {
        'name': args['<project-name>'],
        'start': to_datetime(args['<start-time>']),
    }

    work.append(entry)
    store.dump(data)

    print('Start working on ' + entry['name'] + '.')


def action_fin(args):
    ensure_working()

    data = store.load()
    current = data['work'][-1]

    current['end'] = to_datetime(args['<start-time>'])
    store.dump(data)

    print('So you stopped working on ' + current['name'] + '.')


def action_note(args):
    ensure_working()

    data = store.load()
    current = data['work'][-1]

    content = ' '.join(args['<note-text>'])

    if 'notes' not in current:
        current['notes'] = [content]
    else:
        current['notes'].append(content)

    store.dump(data)

    print('Yep, noted to `' + current['name'] + '`.')


def action_tag(args):
    ensure_working()

    tags = args['<tag>']

    data = store.load()
    current = data['work'][-1]

    current['tags'] = set(current.get('tags') or [])
    current['tags'].update(tags)

    store.dump(data)

    tag_count = str(len(tags))
    print('Okay, tagged current work with ' + tag_count + ' tag' +
            ('s' if tag_count > 1 else '') + '.')


def is_working():
    data = store.load()
    return data.get('work') and 'end' not in data['work'][-1]


def ensure_working():
    if is_working(): return

    print("For all I know, you aren't working on anything."
            " I don't know what to do.", file=sys.stderr)
    print('See `ti -h` to know how to start working.', file=sys.stderr)
    raise SystemExit(1)


def to_datetime(timestr):
    if isinstance(timestr, list): timestr = ' '.join(timestr)
    return parse_time(timestr).isoformat() + 'Z'


def main():
    args = docopt(__doc__, version='2.0-alpha')

    if args['on']:
        action_on(args)
    elif args['fin']:
        action_fin(args)
    elif args['note']:
        action_note(args)
    elif args['tag']:
        action_tag(args)


store = JsonStore('sheet')

if __name__ == '__main__':
    main()
