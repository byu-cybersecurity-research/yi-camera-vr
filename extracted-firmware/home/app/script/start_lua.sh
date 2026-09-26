killall recbackup

for i in 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9
do
	if [ -f "/tmp/cloud_init_finish" ]; then
			break
	else
			#echo "wait cloud_init_finish" $count
			sleep 5
	fi
done

killall recbackup
sleep 1
/home/app/recbackup &
