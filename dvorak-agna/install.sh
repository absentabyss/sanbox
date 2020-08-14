#!/bin/sh
cd ${0%/*}

dvorak_agna_install()
{
	sudo cp -r usr /
}

dvorak_agna_set_as_default()
{
	sudo cp vconsole.conf /etc
	sudo loadkeys dvorak-agna
}

echo "Do you wish to install the dvorak-agna keyboard layout? [y/N]"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	dvorak_agna_install &&
	echo "Success." &&

	echo "Do you wish to set dvorak-agna as your default layout? [y/N]" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		dvorak_agna_set_as_default &&
		echo "Success."
	fi
fi
