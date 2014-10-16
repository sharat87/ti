Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti"

Go two deep in interrupts

  $ ti o task
  Start working on \x1b[32mtask\x1b[39m. (esc)
  $ ti i interrupt1
  Interrupting \x1b[31mtask\x1b[39m with \x1b[32minterrupt: interrupt1\x1b[39m. You are now 1 deep in interrupts. (esc)
  $ ti i interrupt2
  Interrupting \x1b[31minterrupt: interrupt1\x1b[39m with \x1b[32minterrupt: interrupt2\x1b[39m. You are now 2 deep in interrupts. (esc)
  $ ti f
  \x1b[31minterrupt: interrupt2\x1b[39m is done, you're back to working on \x1b[32minterrupt: interrupt1\x1b[39m. (esc)
  $ ti f
  \x1b[31minterrupt: interrupt1\x1b[39m is done, you're back to working on \x1b[32mtask\x1b[39m. (esc)
  $ ti f
  So you stopped working on \x1b[31mtask\x1b[39m. (esc)
