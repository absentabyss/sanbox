t()
{
	if [[ "$@" = "" ]]; then
		ls
	else
		cd "$@" &&
		ls
	fi
}
