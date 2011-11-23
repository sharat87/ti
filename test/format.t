Setup

  $ export SHEET_FILE=$TMP/sheet-format
  $ dcat () { cat $1 | sed 's/\[.\{28\}\]/[date]/g'; }
  $ alias ti="$TESTDIR/../bin/ti"

Confirm no sheet file

  $ test -e $SHEET_FILE
  [1]

Start a project, add content to current file

  $ ti on a-project
  Start working on a-project.
  $ dcat $SHEET_FILE-current
  a-project [date]

End a project, add content to sheet file

  $ ti fin
  So you stopped working on a-project.
  $ dcat $SHEET_FILE
  a-project [date] to [date]

Another one, with notes

  $ ti on another-project
  Start working on another-project.
  $ dcat $SHEET_FILE-current
  another-project [date]
  $ ti note a simple note
  $ dcat $SHEET_FILE-current
  another-project [date]
    a simple note

End and check

  $ ti fin
  So you stopped working on another-project.
  $ dcat $SHEET_FILE
  a-project [date] to [date]
  
  another-project [date] to [date]
    a simple note

Another one, with tags

  $ ti on yet-another-project
  Start working on yet-another-project.
  $ dcat $SHEET_FILE-current
  yet-another-project [date]
  $ ti tag hella
  $ dcat $SHEET_FILE-current
  yet-another-project [date] #hella
  $ ti fin
  So you stopped working on yet-another-project.
  $ dcat $SHEET_FILE
  a-project [date] to [date]
  
  another-project [date] to [date]
    a simple note
  
  yet-another-project [date] to [date] #hella
