# change wlan1 to ap mode.
sudo ifdown wlan0
sudo sudo ifup wlan0=ap

# start hostapd
sudo systemctl start hostapd
#sudo hostapd -B `pwd`/hostapd.wlan0.conf

# start udhcpd
sudo systemctl start udhcpd

# allow ipv4 forwarding
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

# wlan1 -> eth0
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

