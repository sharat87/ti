# ti &mdash; A silly simple time tracker

`ti` is a small command line time tracking application. Simple basic usage
looks like this

    $ ti on my-project
    $ ti fin

You can also give it human-readable times.

    $ ti on my-project 30mins ago

`ti` sports many other cool features. Read along to discover.

## Wat?

`ti` is a simple command line time tracker. It has been completely re-written in
python (from being a bash script) and has (almost) complete test coverage. It is
inspired by [timed](http://adeel.github.com/timed), which is a nice project
and you should check out if you don't like `ti`. It also takes inspiration from
the simplicity of [t](http://stevelosh.com/projects/t/).

If a time tracker tool makes me think for more than 3-5 seconds, I lose my line
of thought and forget what I was doing. This is why I created `ti`. With `ti`,
you'll be as fast as you can type, which you should be good with anyway.

The most important part about `ti` is that it
provides just a few commands to manage your time tracking and gets out
of your way. All data is saved in a JSON file (`~/.ti-sheet`, can be changed by
setting `$SHEET_FILE`) for easy access to whatever you need to do. Some ideas,

- Read your json file to generate beautiful html reports.
- Build monthly statistics based on tags or the tasks themselves.
- Read the currently working project and make it show up in your terminal
  prompt. May be even with how long you've been on it. (!!!)

Its *your* data.

Oh and by the way, the source is a fairly small python script, so if you know
python, you may want to skim over it to get a better feel of how it works.

*Note*: If you have used the previous bash version of `ti`, which was horribly
tied up to only work on linux, you might notice the lack of *plugins* in this
python version. I am not really missing them, so I might not add them. If anyone
has any interesting use cases for it, I'm willing to consider.

## Usage

Here's the minimal usage style:

    $ ti on my-project
    Start working on my-project.

    $ ti status
    You have been working on my-project for less than a minute.

    $ ti fin
    So you stopped working on my-project.

`on` and `fin` can take a time (format described further down) at which to apply
the action.

    $ ti on another-project 2 hours ago
    Start working on another-project.

    $ ti s
    You have been working on another-project for about 2 hours.

    $ ti fin 30 minutes ago
    So you stopped working on another-project.

Also illustrating in the previous example is short aliases of all commands,
their first letter. Like, `s` for `status`, `o` for `on`, `f` for `fin`, etc.

Put brief notes on what you've been doing.

    $ ti note waiting for Napoleon to take over the world
    $ ti n another simple note for demo purposes

Tag your activities for fun and profit.

    $ ti tag imp

Get a log of all activities ordered by time spent with the `log` (or `l`) command.

    $ ti log

List activities in time order with the `list` command.

    $ ti list

Pass a filter to the `list` command to total up the hours of matching records.

    $ ti list +project-x
    
## Command reference

Run `ti -h` (or `--help` or `help` or just `h`) to get a short command summary
of commands.

### on

- Short: `o`
- Syntax: `ti (o|on) <name> [<time>...]`

Start tracking time for the project/activity given by `<name>`. For example,

    ti on conquest

tells `ti` to start tracking for the activitiy `conquest` *now*. You can
optionally specify a relative time in the past like so,

    ti on conquest 10mins ago

The format of the time is detailed further below.

### fin

- Short: `f`
- Syntax: `ti (f|fin) [<time>...]`

End tracking for the current activity *now*. Just like with `on` command above,
you can give an optional time to the past. Example

    ti fin 10mins ago

tells `ti` that you finished working on the current activity at, well, 10
minutes ago.

### status

- Short: `s`
- Syntax: `ti (s|status)`

Gives short human readable message on the current status. i.e., whether anything
is being tracked currently or not. Example,

    $ ti on conqering-the-world
    Start working on conqering-the-world.
    $ ti status
    You have been working on `conqering-the-world` for less than a minute.

### tag

- Short: `t`
- Syntax: `ti (t|tag) <tag>...`

This command adds the given tags to the current activity. Tags are not currently
used within the `ti` time tracker, but they will be saved in the json data file.
You may use them for whatever purposes you like.

For example, if you have a script to generate a html report from your `ti` data,
you could tag some activities with a tag like `red` or `important` so that, that
activity will appear in red in the final html report.

Use it like,

    ti tag red for-joe

adds the tags `red` and `for-joe` to the current activitiy. You can specify any
number of tags.

Tags are currently for your purpose. Use them as you see fit.

### note

- Short: `n`
- Syntax: `ti (n|note) <note-text>...`

This command adds a note on the current activity. Again, like tags, this has no
significance with the time tracking aspect of `ti`. This is for your own
recording purposes and for the scripts your write to process your `ti` data.

Use it like,

    ti note Discuss this with the other team.

adds the note `Discuss this with the other team.` to the current activity.

### log

- Short: `l`
- Syntax: `ti (l|log) [today]`

Gives a table like representation of all activities and total time spent on each
of them.

### list
- Syntax: `ti (list) [filter-1, filter-n]

Provides a list of all activities in the order they occurred.  Passing one or more 
filters will only show matching records and calculate a total number of hours
for the matches.  Works well for a timecard for a project or a time period.

## Time format

Currently only the following are recognized. If there is something that is not
handled, but should be, please open an issue about it or a pull request
(function in question is `parse_time`)

- *n* seconds ago can be written as:
    - *n*seconds ago
    - *n*second ago
    - *n*secs ago
    - *n*sec ago
    - *n*s ago
    - `a` in place of *n* in all above cases, to mean 1 second.
    - Eg., `10s ago`, `a sec ago` `25 seconds ago`, `25seconds ago`.

- *n* minutes ago can be written as:
    - *n*minutes ago
    - *n*minute ago
    - *n*mins ago
    - *n*min ago
    - `a` in place of *n* in all above cases, to mean 1 minute.
    - Eg., `5mins ago`, `a minute ago`, `10 minutes ago`.

- *n* hours ago can be written as:
    - *n*hours ago
    - *n*hour ago
    - *n*hrs ago
    - *n*hr ago
    - `a` or `an` in place of *n* in all above cases, to mean 1 hour.
    - Eg., `an hour ago`, `an hr ago`, `2hrs ago`.

Where *n* is an arbitrary number and any number of spaces between *n* and the
time unit are allowed.

## Status

The project is beta. If you find any bug or have any feedback, please do open an
issue on [Github issues](https://github.com/sharat87/ti/issues).

## Gimme!

You can download `ti` [from the source on
github](https://raw.github.com/sharat87/ti/master/bin/ti)</a>.

- Put it somewhere in your `$PATH` and make sure it has executable permissions.
- Install pyyaml using the command `pip install --user pyyaml`.

After that, `ti` should be working fine.

Also, visit the [project page on github](https://github.com/sharat87/ti) for any
further details.

## Who?

Created and fed by Shrikant Sharat
([@sharat87](https://twitter.com/#!sharat87)). To get in touch, ping me on
twitter or <a href=mailto:shrikantsharat.k@gmail.com>email</a>.

## License

[MIT License](http://mitl.sharats.me).
