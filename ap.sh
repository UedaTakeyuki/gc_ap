# change wlan1 to ap mode.
sudo ifdown wlan0
sudo ifup wlan0=ap

# start hostapd
# refer https://forums.raspberrypi.com/viewtopic.php?t=209818#p1334646
sudo systemctl start hostapd.service
sudo systemctl restart hostapd.service
#sudo service hostapd stop
#sleep 5
#sudo service hostapd start

# start udhcpd
sudo systemctl start udhcpd.service
sudo systemctl restart udhcpd.service


# allow ipv4 forwarding
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sudo sysctl net.ipv4.ip_forward=1

# wlan0 -> eth0
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

# wlan0 -> ppp0
#sudo iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
#sudo iptables -A FORWARD -i ppp0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
#sudo iptables -A FORWARD -i wlan0 -o ppp0 -j ACCEPT
