# Favourite path selector

Associates your favourite long filesystem paths with short names
and makes it easy for you to go to them.

## Setup

Put the `goto-tool` python script into your `~/bin` folder or some
other suitable folder in your `$PATH` and make it executable.

	cp goto-tool ~/bin
	chmod u+x ~/bin/goto-tool

After that, edit your shell configuration, for example `~/.bashrc` or
`~/.zshrc` and source the contents of the `goto.bash` file or
include them directly.

Add the following line at the end of your configuration file to include
the .bash file in your configuration:

	. /path/to/goto.bash

That's all. Now you're able to use the `goto` command as shown in the
Examples section.

If you want tab completion for the available shortcuts in the `goto`
and the `goto-tools` command, source the `goto.completion` file
in your `~/.bash_completion` file like this:

	. /path/to/goto.completion

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

Using gorectories with other commands:

	~$ ls $(goget project)
	... contents of project directory ...
