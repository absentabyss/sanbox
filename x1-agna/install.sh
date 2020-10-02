#!/bin/sh
cd ${0%/*}

x1_agna_install()
{
	sudo cp -r usr /
}

x1_agna_set_as_default()
{
	sudo cp vconsole.conf /etc
	sudo loadkeys x1-agna
}

echo "Do you wish to install the x1-agna keyboard layout? [y/N]"
read -rsn1 reply

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	x1_agna_install &&
	echo "Success." &&

	echo "Do you wish to set x1-agna as your default layout? [y/N]" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		x1_agna_set_as_default &&
		echo "Success."
	fi
fi
