#!/bin/sh
cd ${0%/*}

iptables_install()
{
	sudo iptables-restore < /etc/iptables/empty.rules &&
	sudo iptables -N TCP &&
	sudo iptables -N UDP &&
	sudo iptables -P FORWARD DROP &&
	sudo iptables -P OUTPUT ACCEPT &&
	sudo iptables -P INPUT DROP &&
	sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT &&
	sudo iptables -A INPUT -i lo -j ACCEPT &&
	sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP &&
	sudo iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT &&
	sudo iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP &&
	sudo iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP &&
	sudo iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable &&
	sudo iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset &&
	sudo iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable &&
	sudo iptables -A TCP -p tcp --dport 80 -j ACCEPT &&
	sudo iptables -A TCP -p tcp --dport 443 -j ACCEPT &&
	sudo iptables -A TCP -p tcp --dport 53 -j ACCEPT &&
	sudo iptables -A UDP -p udp --dport 53 -j ACCEPT &&
	sudo iptables-save -f /etc/iptables/iptables.rules &&
	sudo systemctl enable --now iptables.service
}

iptables_install_with_ssh()
{
	sudo iptables-restore < /etc/iptables/empty.rules &&
	sudo iptables -N TCP &&
	sudo iptables -N UDP &&
	sudo iptables -N sshguard &&
	sudo iptables -P FORWARD DROP &&
	sudo iptables -P OUTPUT ACCEPT &&
	sudo iptables -P INPUT DROP &&
	sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT &&
	sudo iptables -A INPUT -i lo -j ACCEPT &&
	sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP &&
	sudo iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT &&
	sudo iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP &&
	sudo iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP &&
	sudo iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable &&
	sudo iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset &&
	sudo iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable &&
	sudo iptables -A INPUT -m multiport -p tcp --destination-ports 21,22000 -j sshguard &&
	sudo iptables -A TCP -p tcp --dport 80 -j ACCEPT &&
	sudo iptables -A TCP -p tcp --dport 443 -j ACCEPT &&
	sudo iptables -A TCP -p tcp --dport 22000 -j ACCEPT &&
	sudo iptables -A TCP -p tcp --dport 53 -j ACCEPT &&
	sudo iptables -A UDP -p udp --dport 53 -j ACCEPT &&
	sudo iptables-save -f /etc/iptables/iptables.rules &&
	sudo systemctl enable --now iptables.service &&
	sudo systemctl enable --now sshguard.service
}

echo "Would you like to configure iptables? [y/N]" &&
read -rsn1 reply &&

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	echo "Do you want to host an ssh server? [y/N]" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		iptables_install_with_ssh &&
		echo "Success."

	else
		iptables_install &&
		echo "Success."
	fi
fi
