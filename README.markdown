# ti - A silly simple time tracker

`ti` is a small command line time tracking application. Simple basic usage
looks like this

    $ ti on my-project
    $ ti fin

You can also give it human-readable times.

    $ ti on my-project 30mins ago

`ti` sports many other cool features. See the [project
page](http://ti.sharats.me) for more details.

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

## Time format

Currently only the following are recognized. If there is something that is not
handled, but should be, please open an issue about it or a pull request
(function in question is `parse_time`)

- *n* minutes ago can be written as:
    - *n*minutes ago
    - *n*minute ago
    - *n*mins ago
    - *n*min ago
    - `a` in place of *n* in all above cases.

Where *n* is an arbitrary number.

## Status

The project is beta. If you find any bug or have any feedback, please do open an
issue on [Github issues](https://github.com/sharat87/ti/issues).

## Gimme!

You can download `ti` [from the source on
github](https://raw.github.com/sharat87/ti/master/bin/ti)</a>. Put it somewhere
in your `$PATH` and make sure it has executable permissions and you should be
able to use it just fine.

## Who?

Created and fed by Shrikant Sharat
([@sharat87](https://twitter.com/#!sharat87)). To get in touch, ping me on
twitter or <a href=mailto:shrikantsharat.k@gmail.com>email</a>.

## License

[MIT License](http://mitl.sharats.me).
