Setup

  $ export SHEET_FILE=$TMP/sheet-format
  $ alias ti="$TESTDIR/../bin/ti"

Confirm no sheet file

  $ test -e $SHEET_FILE
  [1]

Start a project, add content to current file

  $ ti on a-project
  Start working on \x1b[32ma-project\x1b[39m. (esc)

End a project, add content to sheet file

  $ ti fin
  So you stopped working on \x1b[31ma-project\x1b[39m. (esc)

Another one, with notes

  $ ti on another-project
  Start working on \x1b[32manother-project\x1b[39m. (esc)
  $ ti note a simple note
  Yep, noted to \x1b[33manother-project\x1b[39m. (esc)

End and check

  $ ti fin
  So you stopped working on \x1b[31manother-project\x1b[39m. (esc)

Another one, with tags

  $ ti on yet-another-project
  Start working on \x1b[32myet-another-project\x1b[39m. (esc)
  $ ti tag hella
  Okay, tagged current work with 1 tags.
  $ ti fin
  So you stopped working on \x1b[31myet-another-project\x1b[39m. (esc)
