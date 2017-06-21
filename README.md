# goto myproject

Associates your favourite long filesystem paths with short names
and makes it easy for you to go to them.

## Examples

Add a path:

	~$ goto-tool add project /my/very/long/path/to/my/project
	Entry 'project' added, points to '/my/very/long/path/to/my/project'.
	~$

Go to the path:

	~$ goto project
	/my/very/long/path/to/my/project$ ls
	...

Go to a directory relative to the path:

	~$ goto project subdir/anotherSubdir
	/my/very/long/path/to/my/project/subdir/anotherSubdir$ ls
	...

Removing entries:

	~$ goto-tool rm project
	Entry 'project' removed.

	~$ goto project
	Entry 'project' not found.

Listing entries:

	~$ goto-tool list
	ubin: /usr/bin

Using goto directories with other commands:

	~$ ls "$(goget project)"
	... contents of project directory ...

	~$ gorun vim project foo/bar.c
	... editing file foo/bar.c in projects directory ...


## Installation

Clone this repository into a folder of your choosing, e.g.

	cd ~/.local/
	git clone https://github.com/githubnemo/goto-tool.git

Then proceed and configure your shell as described below.

### Bash

Add the following line at the end of your configuration file,
for example `~/.bashrc`, to include the `goto.bash` file in your configuration:

	source ~/.local/goto-tool/goto.bash

That's all. Now you're able to use the `goto` command as shown in the
Examples section.

If you want tab completion for the `goto` and the `goto-tools` command,
include the `goto.completion` file in your `~/.bashrc` or `~/.bash_completion`
on debian/ubuntu like this:

	source ~/.local/goto-tool/goto.completion

**Note**: you need `bash_completion` for tab completion to work.

**Ubuntu/Debian** users have it already.

For **Mac OS X**, you can find a detailled installation guide
[here](http://superuser.com/a/288491).


### ZSH

Add the following line at the end of your configuration file,
for example `~/.zshrc`, to include the `goto.bash` file in your configuration:

	source ~/.local/goto/goto.bash

To add tab completion support, you may want to add the `zsh_completions`
directory to the `fpath` in your `.zshrc`. For example:

	fpath=(~/.local/goto-tool/zsh_completions $fpath)


### Caveats

There is not much that can go wrong. The only thing that
may bug you is that there does not seem to be a way to use
`goget` comfortably in your shell. The reason for this is
that whitespaces don't mix well with subshell commands.

This won't work:

	$ goto-tool add foo '/foo/bar baz/'
    $ ls $(goget foo)

This works:

	$ ls "$(goget foo)"

In most cases it is quicker to use `gorun` to achieve the same:

    $ gorun ls foo
