Setup

  $ export SHEET_FILE=$CRAMTMP/sheet-actions
  $ alias ti="ti --no-color"

Status when not working

  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Status after on-ing a task

  $ ti on conqering-the-world
  Start working on conqering-the-world.
  $ ti status
  You have been working on conqering-the-world for less than a minute.

After adding tags

  $ ti tag awesome
  Okay, tagged current work with 1 tags.
  $ ti status
  You have been working on conqering-the-world for less than a minute.

Status after fin-ing it

  $ ti fin
  So you stopped working on conqering-the-world.
  $ ti status
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]

Short alias `s` for status

  $ ti s
  For all I know, you aren't working on anything. I don't know what to do.
  See `ti -h` to know how to start working.
  [1]
