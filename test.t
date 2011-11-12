Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="SHEET_FILE=$TMP/sheet $TESTDIR/../ti"

Start working

  $ ti on my-project
  Start working on my-project.
  $ test -f $SHEET_FILE
  [1]
  $ test -f $SHEET_FILE-current
  $ ti on another-project
  You are already working on my-project. Stop it or use a different sheet.
  [1]

Check status

  $ ti status
  You have been working on my-project for less than a minute.

Stop working

  $ ti off
  So you stopped working on my-project.
  $ test -f $SHEET_FILE
  $ test -f $SHEET_FILE-current
  [1]
  $ cat $SHEET_FILE
  
  my-project \[[A-Z][a-z]{2} [A-Z][a-z]{2} \d{1,2} \d{1,2}:\d\d:\d\d GMT \d{4}\] to \[[A-Z][a-z]{2} [A-Z][a-z]{2} \d{1,2} \d{1,2}:\d\d:\d\d GMT \d{4}\] (re)
