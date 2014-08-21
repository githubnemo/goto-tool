available_shell() {
	if which zsh > /dev/null; then
		echo "zsh"
	elif which bash > /dev/null; then
		echo "bash"
	else
		echo "sh"
	fi
}

# Attempt to spawn a good shell with appropriate trace features
# when available. Bash and ZSH both have a proper PS4 with line number
# features.
if [ -z "$SIMPLETEST_SHELL_NOFORK" ]; then
	export SIMPLETEST_SHELL_NOFORK=1
	case `available_shell` in
		zsh)
			zsh $0 $*; exit $?
			;;
		bash) bash $0 $*; exit $?
			;;
		*)
			;;
	esac
fi

# Taken from http://stackoverflow.com/a/16844327/1643939
RCol='\e[0m'    # Text Reset
BRed='\e[1;31m';
Gre='\e[0;32m';

output=/dev/null

opt_trace=false
opt_verbose=false

# Parse opt_ parameters relevant for the test eninge.
while [ $# -gt 0 ]; do
	local n
	n=1
	case $1 in
		-t) opt_trace=true ;;
		-v) opt_verbose=true ;;

	esac
	shift $n
done

if $opt_trace; then
	# Enable XTRACE of the shell.
	set -x

	# Set appropiate line number output for XTRACE.
	case $SHELL in
		*/bash*)
			PS4=":\${0}-\${LINENO}> "
			;;
		*/zsh*)
			PS4=":%x:%I> "
			;;
	esac
fi


if $opt_verbose; then
	output=/dev/stdout
fi


printok() {
	/bin/echo -e "${Gre}$@${RCol}"
}

printfail() {
	/bin/echo -e "${BRed}$@${RCol}"
}

must() {
	if ! $@ > $output; then
		printfail "Command $@ failed."
		exit 1
	else
		printok "Command $@ is OK." > $output
	fi
}

fail() {
	if no_exception $@ > $output; then
		printfail "Command ought to fail but exited cleanly."
		exit 1
	else
		printok "Command $@ failed as expected." > $output
	fi
}

no_exception() {
	local ret
	$@
	ret=$?
	if [ $ret -eq 1 ]; then
		printfail "Command $@ threw an exception."
		exit 1
	else
		printok "Command $@ ran cleanly." > $output
	fi
	return $ret
}
