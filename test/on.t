Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="$TESTDIR/../bin/ti"

Start working

  $ ti on my-project
  Start working on my-project.
  $ test -f $SHEET_FILE
  $ test -f $SHEET_FILE-current
  $ ti fin
  So you stopped working on my-project.

Start working while working

  $ ti on project1
  Start working on project1.
  $ ti on project2
  You are already working on my-project. Stop it or use a different sheet.
  [1]
