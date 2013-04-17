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

Go to a directory relativ to the path:

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

	~$ ls $(goget project)
	... contents of project directory ...

	~$ vim $(goget project foo/bar.c)
	... editing file foo/bar.c in projects directory ...


## Setup

Put the `goto-tool` python script into your `~/bin` folder or some
other suitable folder in your `$PATH` and make it executable.

	cp goto-tool ~/bin
	chmod u+x ~/bin/goto-tool

After that, edit your shell configuration as described below.

### Bash

If you want to use tab completion, you'll need `bash_completion`.

**Ubuntu/Debian** users have it already.

For **Mac OS X**, you can find a detailled installation guide
[here](http://superuser.com/a/288491).

Add the following line at the end of your configuration file,
for example `~/.bashrc`, to include the `goto.bash` file in your configuration:

	source ~/.local/goto-tool/goto.bash

That's all. Now you're able to use the `goto` command as shown in the
Examples section.

If you want tab completion for the `goto` and the `goto-tools` command,
include the `goto.completion` file in your `~/.bashrc` or `~/.bash_completion`
on debian/ubuntu like this:

	source ~/.local/goto-tool/goto.completion

### ZSH

Add the following line at the end of your configuration file,
for example `~/.zshrc`, to include the `goto.bash` file in your configuration:

	source ~/.local/goto/goto.bash

To add tab completion support, you may want to add the `zsh_completions`
directory to the `fpath` in your `.zshrc`. For example:

	fpath=(~/.local/goto-tool/zsh_completions $fpath)
