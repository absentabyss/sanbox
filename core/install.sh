#!/bin/sh
cd ${0%/*}

sanbox_patch()
{
	cp -r sanbox /etc &&
	cp -r /etc/sanbox/* /
}

zsh_install()
{
	pacman -S pacman-contrib reflector zsh zsh-completions man-db &&
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
	cp zshrc_preset /etc/zshrc &&
	echo "Check /etc/zshrc for extra dependencies and install them separately."
}

neofetch_install()
{
	cp neofetch /bin
}

yard_install()
{
	cp -r yard /etc
}

echo "Would you like to install Sanbox?"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	sanbox_patch &&
	echo "Patched release files." &&
	zsh_install &&
	echo "Zsh installed." &&
	neofetch_install &&
	echo "Neofetch installed." &&
	yard-install &&
	echo "Success."
fi
