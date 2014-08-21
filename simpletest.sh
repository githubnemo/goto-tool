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

printok "Everything went well."
