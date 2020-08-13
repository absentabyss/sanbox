#!/bin/sh
cd ${0%/*}

iptables_install()
{
	iptables-restore < /etc/iptables/empty.rules &&
	iptables -N TCP &&
	iptables -N UDP &&
	iptables -P FORWARD DROP &&
	iptables -P OUTPUT ACCEPT &&
	iptables -P INPUT DROP &&
	iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT &&
	iptables -A INPUT -i lo -j ACCEPT &&
	iptables -A INPUT -m conntrack --ctstate INVALID -j DROP &&
	iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT &&
	iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP &&
	iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP &&
	iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable &&
	iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset &&
	iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable &&
	iptables -A TCP -p tcp --dport 80 -j ACCEPT &&
	iptables -A TCP -p tcp --dport 443 -j ACCEPT &&
	iptables -A TCP -p tcp --dport 53 -j ACCEPT &&
	iptables -A UDP -p udp --dport 53 -j ACCEPT &&
	iptables-save -f /etc/iptables/iptables.rules &&
	systemctl enable --now iptables.service
}

iptables_install_with_ssh()
{
	iptables-restore < /etc/iptables/empty.rules &&
	iptables -N TCP &&
	iptables -N UDP &&
	iptables -N sshguard &&
	iptables -P FORWARD DROP &&
	iptables -P OUTPUT ACCEPT &&
	iptables -P INPUT DROP &&
	iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT &&
	iptables -A INPUT -i lo -j ACCEPT &&
	iptables -A INPUT -m conntrack --ctstate INVALID -j DROP &&
	iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT &&
	iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP &&
	iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP &&
	iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable &&
	iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset &&
	iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable &&
	iptables -A INPUT -m multiport -p tcp --destination-ports 21,22000 -j sshguard &&
	iptables -A TCP -p tcp --dport 80 -j ACCEPT &&
	iptables -A TCP -p tcp --dport 443 -j ACCEPT &&
	iptables -A TCP -p tcp --dport 22000 -j ACCEPT &&
	iptables -A TCP -p tcp --dport 53 -j ACCEPT &&
	iptables -A UDP -p udp --dport 53 -j ACCEPT &&
	iptables-save -f /etc/iptables/iptables.rules &&
	systemctl enable --now iptables.service &&
	systemctl enable --now sshguard.service
}

echo "Would you like to configure iptables?" &&
read -rsn1 reply &&

if [ $reply == "y" ] || [ $reply == "Y" ]; then
	echo "Do you want to host an ssh server?" &&
	read -rsn1 reply &&

	if [ $reply == "y" ] || [ $reply == "Y" ]; then
		iptables_install_with_ssh &&
		echo "Success."

	else
		iptables_install &&
		echo "Success."
	fi
fi
