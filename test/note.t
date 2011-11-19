Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="$TESTDIR/../bin/ti"

Note when not working

  $ ti note hee-haw
  For all I know, you aren't working on anything. I don't know what to do.
  Use /home/sharat/calypso/labs/ti/test/../bin/ti on <project-name> [description]
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

  $ EDITOR="echo launched editor" ti note
  /home/sharat/calypso/labs/ti/test/../bin/ti: line 42: echo launched editor: command not found
  [127]
