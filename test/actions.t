Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti"

Running an unknown action

  $ ti almost-definitely-a-nonexistent-action
  Usage:
    ti (o|on) <project-name> [<start-time>...]
    ti (f|fin) [<start-time>...]
    ti (s|status)
    ti (t|tag) <tag>...
    ti (n|note) <note-text>...
    ti -h | --help
    ti version | --version
  [1]

Running an ambiguous action
FIXME: There are no ambiguous to test this functionality!

Running short unambiguous aliases for actions
FIXME: Define a couple of stub actions to test this on
