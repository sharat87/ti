Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="$TESTDIR/../bin/ti"

Note when not working

  $ ti note hee-haw
  For all I know, you aren't working on anything. I don't know what to do.
  Use .* on <project-name> \[description\] (re)
  [1]

Start working and then note

  $ ti on donkey-music
  Start working on donkey-music.
  $ ti note hee-haw
  $ cat $SHEET_FILE-current | tail -1
    hee-haw

Add another longer note

  $ ti note holla hoy with a longer musical? note
  $ cat $SHEET_FILE-current | tail -2
    hee-haw
    holla hoy with a longer musical? note

Note with external editor
FIXME: Need a better EDITOR to test with

  $ EDITOR="false" ti note
  [1]
