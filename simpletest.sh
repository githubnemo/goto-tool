#!/bin/sh

. `dirname $0`/simpletest_engine.sh

export GOTO_FILE=`tempfile`

must goto-tool list
must goto-tool add foo /tmp

# Should work after adding the entry 'foo'.
must goto-tool use foo
must goto-tool get foo

# Test using several times to mimic normal behaviour.
must goto-tool use foo
must goto-tool use foo
must goto-tool use foo

# Delete foo and expect every command that accesses foo to fail.
must goto-tool rm foo
fail goto-tool get foo
fail goto-tool use foo
fail goto-tool use foo

# Should fail since there is no 'bar'.
fail goto-tool use bar
fail goto-tool rm bar
fail goto-tool get bar

# Switch GOTO_FILE to another file, entries should be different.
must goto-tool add foo /tmp
must goto-tool get foo
ALT_GOTO_FILE=`tempfile`
GOTO_FILE="$ALT_GOTO_FILE" fail goto-tool get foo
GOTO_FILE="$ALT_GOTO_FILE" must goto-tool add foo /tmp
GOTO_FILE="$ALT_GOTO_FILE" must goto-tool get foo


printok "Everything went well."
