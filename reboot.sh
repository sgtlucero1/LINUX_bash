#!/bin/bash
for i in `cat list | awk '{print $2}'`
do
sshpass -p 'PASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t elucero@$i "echo 'PASSWORD' | sudo -S reboot"

EC=`echo $?`
if [[ $EC == "0" ]];then
MSG="Reboot Successful"
else
MSG="Reboot Failed"
fi
echo -e "Checking $H,$i,ec=$EC,$MSG"
done

