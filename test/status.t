Setup

  $ export SHEET_FILE=$TMP/sheet-status
  $ alias ti="$TESTDIR/../bin/ti --no-color"

Status when not working

  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Status after on-ing a task

  $ ti on conquering-the-world
  Start working on conquering-the-world.
  $ ti status
  You have been working on conquering-the-world for less than a minute.

After adding tags

  $ ti tag awesome
  Okay, tagged current work with 1 tags.
  $ ti status
  You have been working on conquering-the-world for less than a minute.

Status after fin-ing it

  $ ti fin
  So you stopped working on conquering-the-world.
  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Short alias `s` for status

  $ ti s
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]
