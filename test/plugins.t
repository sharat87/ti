Setup

  $ export SHEET_FILE=$TMP/sheet-plugins
  $ export TI_CONF_DIR=$TMP/conf-dir
  $ mkdir $TI_CONF_DIR
  $ alias ti="$TESTDIR/../bin/ti"

Add a new plugin and check

  $ cat <<EOF > $TI_CONF_DIR/greeter.ti
  > action-greet () {
  >     echo Hello there!
  > }
  > EOF
  $ ti greet
  Hello there!
  $ rm $TI_CONF_DIR/greeter.ti

Should work with *.ti.sh too

  $ cat <<EOF > $TI_CONF_DIR/greeter.ti.sh
  > action-greet () {
  >     echo Hello there!
  > }
  > EOF
  $ ti greet
  Hello there!
