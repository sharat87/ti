Setup

  $ export SHEET_FILE=$TMP/sheet-on
  $ alias ti="$TESTDIR/../bin/ti --no-color"

Start working

  $ ti on my-project
  Start working on my-project.
  $ test -f $SHEET_FILE
  $ ti fin
  So you stopped working on my-project.

Start working while working

  $ ti on project1
  Start working on project1.
  $ ti fin
  So you stopped working on project1.
  $ ti on project2
  Start working on project2.
  $ ti log
  project2    \xe2\x88\x99\xe2\x88\x99   \xe2\x86\x90 working (esc)
  project1    \xe2\x88\x99\xe2\x88\x99   (esc)
  my-project  \xe2\x88\x99\xe2\x88\x99   (esc)
  $ ti log | grep project1
  project1    \xe2\x88\x99\xe2\x88\x99   (esc)
  $ ti fin
  So you stopped working on project2.
  $ ti log
  project2    \xe2\x88\x99\xe2\x88\x99   (esc)
  project1    \xe2\x88\x99\xe2\x88\x99   (esc)
  my-project  \xe2\x88\x99\xe2\x88\x99   (esc)
