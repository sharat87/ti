Setup

  $ export SHEET_FILE=$CRAMTMP/sheet-actions
  $ alias ti="ti --no-color"

Confirm no sheet file

  $ test -e $SHEET_FILE
  [1]

Start a project, add content to current file

  $ ti on a-project
  Start working on a-project.

End a project, add content to sheet file

  $ ti fin
  So you stopped working on a-project.

Another one, with notes

  $ ti on another-project
  Start working on another-project.
  $ ti note a simple note
  Yep, noted to another-project.

End and check

  $ ti fin
  So you stopped working on another-project.

Another one, with tags

  $ ti on yet-another-project
  Start working on yet-another-project.
  $ ti tag hella
  Okay, tagged current work with 1 tags.
  $ ti fin
  So you stopped working on yet-another-project.
