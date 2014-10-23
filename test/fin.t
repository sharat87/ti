Setup

  $ export SHEET_FILE=$TMP/sheet-fin
  $ alias ti="$TESTDIR/../bin/ti --no-color"

Running fin when not working

  $ ti fin
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Incorrectly running it (above) shouldn't create any file

  $ test -f $SHEET_FILE
  [1]

Start a task and then fin

  $ ti on testing-my-foot
  Start working on testing-my-foot.
  $ ti fin
  So you stopped working on testing-my-foot.
  $ test -f $SHEET_FILE

Fin a tagged activity

  $ ti on tagged-one
  Start working on tagged-one.
  $ ti tag woohoo
  Okay, tagged current work with 1 tags.
  $ ti fin
  So you stopped working on tagged-one.

Check the current file existence

  $ ti on awesomeness
  Start working on awesomeness.
  $ ti fin
  So you stopped working on awesomeness.
  $ test -f $SHEET_FILE
