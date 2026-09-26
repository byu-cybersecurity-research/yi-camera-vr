pid=$(ps|grep p2p_tnp|grep -v grep|awk '{print $1}')
cat /proc/$pid/status|grep VmRSS|awk '{print $2}'
