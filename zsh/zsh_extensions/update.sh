update()
{
	if [[ "$@" == "" ]]; then
		echo "If the download speed is too slow, try \"-a\" flag.\nYou can use \"-m\" to update mirrorlist or \"-r\" to purge orphans and outdated packages."
		pacaur -Syu
		sudo paccache -r
		sudo pacman -Rns $(pacman -Qtdq)
	elif [[ "$@" == "-a" ]]; then
		sudo echo ':: Synchronizing mirrorlist...'
		sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist &&
		pacaur -Syu
		sudo paccache -r
		sudo pacman -Rns $(pacman -Qtdq)
	elif [[ "$@" == "-m" ]]; then
		sudo echo ':: Synchronizing mirrorlist...'
		sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist &&
		echo "Done."
	elif [[ "$@" == "-r" ]]; then
		sudo paccache -r
		sudo pacman -Rns $(pacman -Qtdq)
	else
		echo "Error: Unknown flag.\nAvailable flags:\n\t-a\tComplete update.\n\t-m\tUpdate mirrorlist.\n\t-r\tPurge orphan and outdated packages."
	fi
}
