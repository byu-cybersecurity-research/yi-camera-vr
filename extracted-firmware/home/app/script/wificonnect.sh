ifconfig wlan0 up
sleep 1
#/home/base/tools/wpa_supplicant -c/tmp/wpa_supplicant.conf -g/tmp/wpa_supplicant-global -iwlan0 -B;
/backup/tools/wpa_supplicant -c/tmp/wpa_supplicant.conf -g/var/run/wpa_supplicant-global -Dnl80211 -iwlan0 -B;
