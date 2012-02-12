# Description of the GOTO format file

The format is a plain text format encoded with colons (`:`) as separators.

The encoding is UTF-8.

Usage of separator in one of the fields is done by escaping it with a
backslash (`\ `).

## Fields

The fields are
* name
* the path to the directory
* last access date (may be empty)
* usage count (may be empty)

Empty fields are empty (no data) but are separated.

## Examples

	p1:/home/me/p1::
	p2:/home/me/p2:1327390466:1
	p3:/home/me/p\:3:1325350444:1
