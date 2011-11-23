Setup

  $ export SHEET_FILE=$TMP/sheet-fin
  $ alias ti="$TESTDIR/../bin/ti"

Running fin when not working

  $ ti fin
  For all I know, you aren't working on anything. I don't know what to do.
  Use .* on <project-name> \[description\] (re)
  [1]

Incorrectly running it (above) shouldn't create any file

  $ test -f $SHEET_FILE
  [1]
  $ test -f $SHEET_FILE-current
  [1]

Start a task and then fin

  $ ti on testing-my-foot
  Start working on testing-my-foot.
  $ ti fin
  So you stopped working on testing-my-foot.
  $ test -f $SHEET_FILE
  $ test -f $SHEET_FILE-current
  [1]

Fin a tagged activity

  $ ti on tagged-one
  Start working on tagged-one.
  $ ti tag woohoo
  $ ti fin
  So you stopped working on tagged-one.
  $ test -f $SHEET_FILE-current
  [1]

Check the current file existence

  $ ti on awesomeness
  Start working on awesomeness.
  $ test -f $SHEET_FILE-current
  $ ti fin
  So you stopped working on awesomeness.
  $ test -f $SHEET_FILE
  $ test -f $SHEET_FILE-current
  [1]
