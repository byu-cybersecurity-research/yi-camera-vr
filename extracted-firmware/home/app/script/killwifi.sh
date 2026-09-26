timeoutcnt=$(cat /proc/timeout_cnt)
echo "timeoutcnt="$timeoutcnt
timeoutcnt_target=100

if [ $timeoutcnt -gt $timeoutcnt_target ]
then
        echo "more timeoutcnt="$timeoutcnt
        #echo "force reboot by timeoutcnt" >> /tmp/sd/ifconfig_info
        reboot_by_watchdog
		reboot
else
        echo "less timeoutcnt="$timeoutcnt 
fi

overruns=$(ifconfig |grep overruns|grep "RX"|awk '{print $5}'|cut -d: -f2)
echo "overruns="$overruns
target=10

if [ $overruns -gt $target ]
then
        echo "more overruns="$overruns
		#echo "force reboot by overruns" >> /tmp/sd/ifconfig_info
		#ifconfig >> /tmp/sd/ifconfig_info
        reboot_by_watchdog
		reboot
else
        echo "less overruns="$overruns 
fi

ifconfig wlan0 0.0.0.0
killall -9 hostapd
killall -9 udhcpd
killall wpa_supplicant
killall udhcpc
killall p2p_tnp
killall cloud

target_pid=1
pid=$(ps|grep test_single.sh|grep -v grep|grep -v $1|awk '{if(NR==1){print $1;}}')
if [ $pid -gt $target_pid ]
then
    killall -9 hostapd
    killall -9 udhcpd
	killall wpa_supplicant
	killall udhcpc
	killall p2p_tnp
	killall cloud
	sleep 1
	kill -9 $pid
	echo "kill process" $pid
	
	pid1=$(ps|grep test_single.sh|grep -v grep|grep -v $1|awk '{if(NR==1){print $1;}}')
	if [ $pid1 -gt $target_pid ]
	then
        killall -9 hostapd
        killall -9 udhcpd
		killall wpa_supplicant
		killall udhcpc
		killall p2p_tnp
		killall cloud
		sleep 1
		kill -9 $pid1
		echo "kill process1" $pid1
	else
		echo "only one killwifi.sh" 
	fi	
	
else
    echo "only one killwifi.sh" 
fi
