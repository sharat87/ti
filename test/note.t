Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="$TESTDIR/../bin/ti"

Note when not working

  $ ti note hee-haw
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Start working and then note

  $ ti on donkey-music
  Start working on \x1b[32mdonkey-music\x1b[39m. (esc)
  $ ti note hee-haw
  Yep, noted to \x1b[33mdonkey-music\x1b[39m. (esc)

Add another longer note

  $ ti note holla hoy with a longer musical? note
  Yep, noted to \x1b[33mdonkey-music\x1b[39m. (esc)

Note with external editor
FIXME: Need a better EDITOR to test with

  $ EDITOR="false" ti note
  Please provide some text to be noted.
