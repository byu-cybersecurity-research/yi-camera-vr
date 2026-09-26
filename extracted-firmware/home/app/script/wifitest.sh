rm /tmp/arping*
arping -I wlan0 $1 -c 100 | grep Received 1>/tmp/arping.info
mv /tmp/arping.info /tmp/arping_result.info
