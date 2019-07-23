# install hostapd_mac80211
sudo apt-get install hostapd

# install hostapd_r8188eu
git clone https://github.com/PlantDaddy/hostapd-rtl8188.git /home/pi/hostapd-rt$
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u11_armhf.deb
sudo apt install `pwd`/libssl1.0.0_1.0.1t-1+deb8u11_armhf.deb


# install udhcpd
sudo apt-get install udhcpd

# For buster, unmask
# https://github.com/raspberrypi/documentation/issues/1018
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
