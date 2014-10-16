Setup

  $ export SHEET_FILE=$TMP/sheet-status
  $ alias ti="$TESTDIR/../bin/ti"

Status when not working

  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Status after on-ing a task

  $ ti on conqering-the-world
  Start working on \x1b[32mconqering-the-world\x1b[39m. (esc)
  $ ti status
  You have been working on \x1b[32mconqering-the-world\x1b[39m for less than a minute. (esc)

After adding tags

  $ ti tag awesome
  Okay, tagged current work with 1 tags.
  $ ti status
  You have been working on \x1b[32mconqering-the-world\x1b[39m for less than a minute. (esc)

Status after fin-ing it

  $ ti fin
  So you stopped working on \x1b[31mconqering-the-world\x1b[39m. (esc)
  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Short alias `s` for status

  $ ti s
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]
