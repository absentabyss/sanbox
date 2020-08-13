#!/bin/sh
cd ${0%/*}

sanbox_patch()
{
	cp -r sanbox /etc &&
	cp -r /etc/sanbox/* /
}

zsh_install()
{
	echo "Check /etc/zshrc for extra dependencies and install them separately." &&
	pacman -S pacman-contrib reflector zsh zsh-completions man-db &&
	cp zshrc_preset /etc/zshrc &&
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

echo "Would you like to install Sanbox?"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	echo "Remember to run install_2.sh once you enter zsh."
	read -rsn1 null

	sanbox_patch &&
	echo "Patched release files." &&
	zsh_install
fi
