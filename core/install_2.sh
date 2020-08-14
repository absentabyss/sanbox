#!/bin/sh
cd ${0%/*}

neofetch_install()
{
	sudo cp neofetch /bin
}

yard_install()
{
	sudo cp -r yard /etc
}

echo "Would you like to continue Sanbox installation? (If you haven't, run install_1.sh first.) [y/N]"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	neofetch_install &&
	echo "Neofetch installed." &&
	yard-install &&
	echo "Yard installed."
	echo "Success."
fi
