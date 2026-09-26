bcmver="bd1e"
bcmver1="0bdc"
bcmcmd=$(lsusb|grep "0a5c"|cut -d':' -f3)

if [ $bcmver = $bcmcmd ];then
	echo "usb2sd not support"
elif [ $bcmver1 = $bcmcmd ];then
	echo "usb2sd not support"
else
	if [ -e /dev/mmcblk0p1 ]; then	
		insmod /home/base/dwc_otg.ko	
		insmod /home/base/g_file_storage.ko file=/dev/mmcblk0p1 luns=1 stall=0 removable=1 	
	fi
fi
