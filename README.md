# Favourite path selector

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

Removing entries:

	~$ goto-tool rm project
	Entry 'project' removed.

	~$ goto project
	Entry 'project' not found.

Listing entries:

	~$ goto-tool list
	{'ubin': '/usr/bin'}
