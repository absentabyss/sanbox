#!/bin/sh
cd ${0%/*}

gvim_install()
{
	pacman -S gvim &&
	ln -s /bin/vim /bin/v &&
	cp vimrc /etc
}

vim_install()
{
	pacman -S vim &&
	ln -s /bin/vim /bin/v &&
	cp vimrc /etc
}

echo "Do you wish to install Sanbox's version of Vim?" &&
read -rsn1 reply &&

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	echo "Would you like to install GVim?" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		gvim_install &&
		echo "Success." &&
	
	else
		vim_install &&
		echo "Success." &&
	fi

	echo "You might need to run :PluginInstall as root. Check the installation documentation for each plugin in /etc/vimrc."
fi
