mnt()
{
	sudo mount $@ /mnt && cd /mnt
}

umnt()
{
	sudo umount -R /mnt
}

