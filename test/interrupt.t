Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti"

Go two deep in interrupts

  $ ti o task
  Start working on task.
  $ ti i interrupt1
  So you stopped working on task.
  Start working on interrupt: interrupt1.
  You are now 1 deep in interrupts.
  $ ti i interrupt2
  So you stopped working on interrupt: interrupt1.
  Start working on interrupt: interrupt2.
  You are now 2 deep in interrupts.
  $ ti f
  So you stopped working on interrupt: interrupt2.
  Start working on interrupt: interrupt1.
  You are now 1 deep in interrupts.
  $ ti f
  So you stopped working on interrupt: interrupt1.
  Start working on task.
  Congrats, you're out of interrupts!
  $ ti f
  So you stopped working on task.
