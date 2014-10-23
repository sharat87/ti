Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti --no-color"

Running an unknown action

  $ ti almost-definitely-a-nonexistent-action
  I don't understand 'almost-definitely-a-nonexistent-action'

Running an ambiguous action
FIXME: There are no ambiguous to test this functionality!

Running short unambiguous aliases for actions
FIXME: Define a couple of stub actions to test this on
