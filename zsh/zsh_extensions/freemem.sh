freemem()
{
	sudo echo 'Clearing swap...'
	sudo swapoff -a
	echo 'Reassigning swap...'
	sudo swapon -a
	echo 'Clearing cache...'
	sudo sync
	sudo sh -c '/usr/bin/echo 3 > /proc/sys/vm/drop_caches'
	echo 'Done.'
}

