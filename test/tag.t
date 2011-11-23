Setup

  $ export SHEET_FILE=$TMP/sheet-tag
  $ alias ti="$TESTDIR/../bin/ti"

When not working

  $ ti tag a-tag
  For all I know, you aren't working on anything. I don't know what to do.
  Use /home/sharat/labs/ti/test/../bin/ti on <project-name> [description]
  [1]

Not giving a tag to add

  $ ti on something
  Start working on something.
  $ ti tag
  Please give a tag to apply to current activity.
  [1]
