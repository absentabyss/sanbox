#!/bin/sh
cd ${0%/*}

dvorak_agna_install()
{
	cp -r usr / &&
	cp -r etc /
}

dvorak_agna_set_as_default()
{
	cp vconsole.conf /etc
}

echo "Do you wish to install the dvorak-agna keyboard layout? [y/N]"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	dvorak_agna_install &&
	echo "Success." &&

	echo "Do you wish to set dvorak-agna as your default layout?" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		dvorak_agna_set_as_default &&
		echo "Success."
	fi
fi
