Setup

  $ export SHEET_FILE=$TMP/sheet-tag
  $ alias ti="$TESTDIR/../bin/ti"

When not working

  $ ti tag a-tag
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Not giving a tag to add

  $ ti on something
  Start working on something.
  $ ti tag
  Usage:
    ti (o|on) <project-name> [<start-time>...]
    ti (f|fin) [<start-time>...]
    ti (s|status)
    ti (t|tag) <tag>...
    ti (n|note) <note-text>...
    ti -h | --help
    ti version | --version
  [1]
