# https://elinux.org/RPI-Wireless-Hotspot

# install ifupdown
sudo apt-get install ifupdown
sudo sh -c "cp setting_files/gc /etc/network/interfaces.d/"

# install hostapd_mac80211
sudo apt-get install hostapd
sudo sh -c "cp hostapd.conf /etc/hostapd/"
sudo sh -c "cp hostapd /etc/default/"

# install hostapd_r8188eu
git clone https://github.com/PlantDaddy/hostapd-rtl8188.git /home/pi/hostapd-rt$
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u11_armhf.deb
sudo apt install `pwd`/libssl1.0.0_1.0.1t-1+deb8u11_armhf.deb


# install udhcpd
sudo apt-get install udhcpd
sudo sh -c "cp udhcpd.conf /etc/default/"

# For buster, unmask
# https://github.com/raspberrypi/documentation/issues/1018
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
