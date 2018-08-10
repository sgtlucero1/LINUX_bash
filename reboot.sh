#!/bin/bash                                                   
for i in `cat list | awk '{print $2}'`                                          
do
#reboot commands to follow
sshpass -p 'MYPASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t  elucero@$i cat /etc/redhat-release

EC=`echo $?`
if [[ $EC == "0" ]];then
MSG="Login OK"
else
MSG="Login Failed"
fi
echo -e "Checking $H,$i,ec=$EC,$MSG"
done
