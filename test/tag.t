Setup

  $ export SHEET_FILE=$TMP/sheet-tag
  $ alias ti="$TESTDIR/../bin/ti --no-color"

When not working

  $ ti tag a-tag
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Not giving a tag to add

  $ ti on something
  Start working on something.
  $ ti tag
  Please provide at least one tag to add.
