# To be sourced in your .bashrc

goto() {
	if [ "$#" -eq 0 ]; then
		echo "Usage: goto <dirname> [<subpath>]"
		return 1
	fi

	DIR=$(goto-tool get $1)

	if [ "$?" -eq 0 ]; then
		if [ "$#" -gt 1 ]; then
			cd $DIR/$2
		else
			cd $DIR
		fi
	fi
}

goget() {
	DIR=$(goto-tool get $1) && echo $DIR
}
