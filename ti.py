# encoding: utf-8

"""
ti is a simple and extensible time tracker for the command line.

Usage:
  ti on <project-name> [<start-time>...]
  ti fin [<start-time>...]
  ti status
  ti tag <tag>...
  ti note
  ti edit
  ti -h | --help
  ti version | --version

Options:
  <start-time>...   A time specification (Described further down).
  -h --help     Show this help.
"""

from __future__ import print_function
from __future__ import unicode_literals

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
        'start': 'now',
    }

    work.append(entry)
    store.dump(data)

    print('Start working on ' + entry['name'] + '.')


def action_fin(args):
    data = store.load()
    work = data['work']

    if not work or 'end' in work[-1]:
        print("For all I know, you aren't working on anything."
                " I don't know what to do.", file=sys.stderr)
        print('See `ti -h` to know how to start working.', file=sys.stderr)
        raise SystemExit(1)

    work[-1]['end'] = 'later'
    store.dump(data)

    print('So you stopped working on ' + work[-1]['name'] + '.')


def main():
    args = docopt(__doc__, version='2.0-alpha')

    if args['on']:
        action_on(args)
    elif args['fin']:
        action_fin(args)


store = JsonStore('sheet')

if __name__ == '__main__':
    main()
