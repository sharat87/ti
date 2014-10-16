Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti"

Go two deep in interrupts

  $ ti o task
  Start working on task.
  $ ti i interrupt1
  Interrupting task with interrupt1. You are now 1 deep in interrupts.
  $ ti i interrupt2
  Interrupting interrupt1 with interrupt2. You are now 2 deep in interrupts.
  $ ti f
  interrupt2 is done, you're back to working on interrupt1.
  $ ti f
  interrupt1 is done, you're back to working on task.
  $ ti f
  So you stopped working on task.
