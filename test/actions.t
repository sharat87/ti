Setup

  $ export SHEET_FILE=$TMP/sheet-actions
  $ alias ti="$TESTDIR/../bin/ti"

Running an unknown action

  $ ti almost-definitely-a-nonexistent-action
  No action 'almost-definitely-a-nonexistent-action' found
  [1]

Running an ambiguous action
FIXME: There are no ambiguous to test this functionality!

Running short unambiguous aliases for actions
FIXME: Define a couple of stub actions to test this on
