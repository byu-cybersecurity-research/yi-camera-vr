#!/bin/sh
ifconfig wlan0 down
#ps -ef | grep hostapd | grep -v grep | awk '{print $1}' | xargs kill -9
#ps -ef | grep wpa_supplicant | grep -v grep | awk '{print $1}' | xargs kill -9
#ps -ef | grep udhcpd | grep -v grep | awk '{print $1}' | xargs kill -9
cd /home/app/localbin
hostapd -B /backup/ap/config/hostapd.conf
ifconfig wlan0 192.168.10.1
udhcpd -f /backup/ap/config/udhcpd.conf &
cd -
