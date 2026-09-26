echo -e "ctrl_interface=/var/run/wpa_supplicant\nap_scan=1\nnetwork={\nssid=\"TP-LINK_gzy\"\nscan_ssid=1\nkey_mgmt=NONE\n}" > /tmp/wpa.conf

ifconfig wlan0 up
sleep 1
/backup/tools/wpa_supplicant -c/tmp/wpa.conf  -g/var/run/wpa_supplicant-global -Dnl80211 -iwlan0 -B

killall udhcpc
udhcpc -i wlan0 -b -s /backup/tools/default.script

rm /tmp/wpa.conf
