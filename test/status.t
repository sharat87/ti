Setup

  $ export SHEET_FILE=$TMP/sheet-status
  $ alias ti="$TESTDIR/../bin/ti"

Status when not working

  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  Use .* on <project-name> \[description\] (re)
  [1]

Status after on-ing a task

  $ ti on conqering-the-world
  Start working on conqering-the-world.
  $ ti status
  You have been working on conqering-the-world for less than a minute.

Status after fin-ing it

  $ ti fin
  So you stopped working on conqering-the-world.
  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  Use /home/sharat/calypso/labs/ti/test/../bin/ti on <project-name> [description]
  [1]

Short alias `st` for status

  $ ti st
  For all I know, you aren't working on anything. I don't know what to do.
  Use /home/sharat/calypso/labs/ti/test/../bin/ti on <project-name> [description]
  [1]
