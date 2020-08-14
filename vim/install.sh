#!/bin/sh
cd ${0%/*}

gvim_install()
{
	sudo pacman -S gvim &&
	sudo ln -s /bin/vim /bin/v &&
	sudo git clone https://github.com/VundleVim/Vundle.vim.git /vim/bundle/Vundle.vim
	sudo cp vimrc /etc
}

vim_install()
{
	sudo pacman -S vim &&
	sudo ln -s /bin/vim /bin/v &&
	sudo git clone https://github.com/VundleVim/Vundle.vim.git /vim/bundle/Vundle.vim
	sudo cp vimrc /etc
}

echo "Do you wish to install Sanbox's version of Vim? [y/N]" &&
read -rsn1 reply &&

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	echo "Would you like to install GVim? [y/N]" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		gvim_install &&
		echo "Success."
	
	else
		vim_install &&
		echo "Success."
	fi

	echo "You might need to run :PluginInstall as root. Check the installation documentation for each plugin in /etc/vimrc."
fi
