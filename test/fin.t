Setup

  $ export SHEET_FILE=$TMP/sheet
  $ alias ti="$TESTDIR/../bin/ti"

Running fin when not working

  $ ti fin
  For all I know, you aren't working on anything. I don't know what to do.
  Use /home/sharat/calypso/labs/ti/test/../bin/ti on <project-name> [description]
  [1]

Incorrectly running it (above) shouldn't create any file

  $ file $SHEET_FILE
  /tmp/cramtests-TF2Wyd/tmp/sheet: ERROR: cannot open `/tmp/cramtests-TF2Wyd/tmp/sheet' (No such file or directory)
  [1]
  $ file $SHEET_FILE-current
  /tmp/cramtests-TF2Wyd/tmp/sheet-current: ERROR: cannot open `/tmp/cramtests-TF2Wyd/tmp/sheet-current' (No such file or directory)
  [1]

Start a task and then fin

  $ ti on testing-my-foot
  Start working on testing-my-foot.
  $ ti fin
  So you stopped working on testing-my-foot.
  $ file $SHEET_FILE
  /tmp/cramtests-TF2Wyd/tmp/sheet: ASCII text
  $ file $SHEET_FILE-current
  /tmp/cramtests-TF2Wyd/tmp/sheet-current: ERROR: cannot open `/tmp/cramtests-TF2Wyd/tmp/sheet-current' (No such file or directory)
  [1]

Check the current file existence

  $ ti on awesomeness
  Start working on awesomeness.
  $ file $SHEET_FILE-current
  /tmp/cramtests-TF2Wyd/tmp/sheet-current: ASCII text
  $ ti fin
  So you stopped working on awesomeness.
  $ file $SHEET_FILE
  /tmp/cramtests-TF2Wyd/tmp/sheet: ASCII text
  $ file $SHEET_FILE-current
  /tmp/cramtests-TF2Wyd/tmp/sheet-current: ERROR: cannot open `/tmp/cramtests-TF2Wyd/tmp/sheet-current' (No such file or directory)
  [1]
