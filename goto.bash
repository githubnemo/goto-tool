# To be sourced in your .bashrc

goto() {
	DIR=$(goto-tool get $1)
	if [ "$?" -eq 0 ]; then
		cd $DIR
	fi
}
