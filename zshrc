# User defined functions
c()
{
	$@ & disown && exit
}

env.c()
{
	cp -n /home/agna/.local/etc/c/*(DN) .
}

env.cpp()
{
	cp -n /home/agna/.local/etc/cpp/*(DN) .
}

env.js()
{
	cp -n /home/agna/.local/etc/js/*(DN) .
}

f()
{
	$@ &> /dev/null & disown 
}

mnt()
{
	sudo mount $@ /mnt && cd /mnt
}

t()
{
	if [[ "$@" = "" ]]; then
		ls
	else
		cd "$@"&&ls
	fi
}

umnt()
{
	sudo umount -R /mnt
}

update()
{
	if [[ "$@" == "" ]]; then
		echo "If the download speed is too slow, try \"-a\" flag.\nYou can use \"-m\" to update mirrorlist or \"-r\" to purge orphans and outdated packages."&&yay -Syu&&sudo cp ~/.config/neucom-os/etc/* /etc&&sudo cp ~/.config/us /usr/share/X11/xkb/symbols/us&&sudo paccache -r&&sudo pacman -Rns $(pacman -Qtdq)
	elif [[ "$@" == "-a" ]]; then
		sudo echo ':: ミラーリストの同期中...'&&sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist&&yay -Syu&&sudo cp ~/.config/neucom-os/etc/* /etc&&sudo cp ~/.config/us /usr/share/X11/xkb/symbols/us&&sudo paccache -r&&sudo pacman -Rns $(pacman -Qtdq)
	elif [[ "$@" == "-m" ]]; then
		sudo echo ':: ミラーリストの同期中...'&&sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist&&echo "Done."
	elif [[ "$@" == "-r" ]]; then
		sudo paccache -r&&sudo pacman -Rns $(pacman -Qtdq)
	else
		echo "Error: Unknown flag.\nAvailable flags:\n\t-a\tComplete update.\n\t-m\tUpdate mirrorlist.\n\t-r\tPurge orphan and outdated packages."
	fi
}

yard()
{
	if [[ "$2" == "" ]]; then
		if [[ "$1" == "cpp" ]]; then
			mkdir tmp && cd tmp && env.cpp && v main.cpp && cd - && rm -r tmp
		elif [[ "$1" == "c" ]]; then
			mkdir tmp && cd tmp && env.c && v main.c && cd - && rm -r tmp
		elif [[ "$1" == "js" ]]; then
			mkdir tmp && cd tmp && env.js && v script.js && cd - && rm -r tmp
		else
			mkdir tmp && cd tmp && v yard."$1" && cd - && rm -r tmp
		fi
	else
		if [[ "$1" == "cpp" ]]; then
			mkdir "$2" && cd "$2" && env.cpp && v main.cpp
		elif [[ "$1" == "c" ]]; then
			mkdir "$2" && cd "$2" && env.c && v main.c
		elif [[ "$1" == "js" ]]; then
			mkdir "$2" && cd "$2" && env.js && v script.js
		else
			mkdir "$2" && cd "$2" && v "$2"."$1"
		fi
	fi
}

# Aliases
alias agus="ssh -p 22000 agusavior@agusavior.ddns.net"
alias bots="ssh -p 22000 bots@agna.me"
alias freemem="sudo echo 'Clearing swap...'&&sudo swapoff -a&&echo 'Reassigning swap...'&&sudo swapon -a&&echo 'Clearing cache...'&&sudo sync&&sudo sh -c '/usr/bin/echo 3 > /proc/sys/vm/drop_caches'&&echo 'Done.'"
alias get+="yay -S"
alias get="sudo pacman -S"
alias irssi="irssi -n absentabyss"
alias ping="ping 8.8.8.8"
alias purge="sudo pacman -Rsc"
alias q="cd ~/Documents && v -c \"NERDTree | wincmd p\" queue && cd -"
alias t..="t .."
alias tt="t ~"
alias v.="v ."
alias z="fg"

t
