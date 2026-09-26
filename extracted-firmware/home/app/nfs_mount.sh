#!/bin/sh
    nfs=`cat /proc/filesystems | grep nfs4 | awk '{print $2}'`
    if [ "${nfs}" != "nfs4" ];then
        echo "not support nfs filesystem!"
        exit 1
    fi
    if [ -d /home/app/nfs  ];then
        #mount -t nfs -o nolock,rsize=1024,wsize=1024 192.168.2.111:/srv/share/fangyan /home/app/nfs/
        mount -t nfs -o nolock,rsize=1024,wsize=1024 192.168.2.111:/nfs /home/app/nfs/
    else
        mkdir /home/app/nfs
        #mount -t nfs -o nolock,rsize=1024,wsize=1024 192.168.2.111:/srv/share/fangyan /home/app/nfs/
        mount -t nfs -o nolock,rsize=1024,wsize=1024 192.168.2.111:/nfs /home/app/nfs/
    fi
