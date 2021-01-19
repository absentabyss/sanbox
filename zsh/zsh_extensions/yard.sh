code_editor="$code_editor"

env.c()
{
	cp -n /etc/yard/c/*(DN) .
}

env.cpp()
{
	cp -n /etc/yard/cpp/*(DN) .
}

env.js()
{
	cp -n /etc/yard/js/*(DN) .
}

yard()
{
	if [[ "$2" == "" ]]; then
		mkdir tmp &&
		cd tmp &&

		if [[ "$1" == "cpp" ]]; then
			env.cpp &&
			$code_editor main.cpp &&

		elif [[ "$1" == "c" ]]; then
			env.c &&
			$code_editor main.c &&

		elif [[ "$1" == "js" ]]; then
			env.js &&
			$code_editor script.js &&

		else
			$code_editor yard."$1" &&
		fi

		cd - &&
		rm -r tmp

	else
		mkdir "$2" &&
		cd "$2" &&

		if [[ "$1" == "cpp" ]]; then
			env.cpp &&
			$code_editor main.cpp

		elif [[ "$1" == "c" ]]; then
			env.c &&
			$code_editor main.c

		elif [[ "$1" == "js" ]]; then
			env.js &&
			$code_editor script.js

		else
			$code_editor "$2"."$1"
		fi
	fi
}
