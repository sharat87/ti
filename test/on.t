Setup

  $ export SHEET_FILE=$TMP/sheet-on
  $ alias ti="$TESTDIR/../bin/ti"

Start working

  $ ti on my-project
  Start working on \x1b[32mmy-project\x1b[39m. (esc)
  $ test -f $SHEET_FILE
  $ ti fin
  So you stopped working on \x1b[31mmy-project\x1b[39m. (esc)

Start working while working

  $ ti on project1
  Start working on \x1b[32mproject1\x1b[39m. (esc)
  $ ti on project2
  You are already working on \x1b[33mproject1\x1b[39m. Stop it or use a different sheet. (esc)
  [1]
