#!/bin/bash                                                   
for i in `cat list | awk '{print $2}'`                                          
do
sshpass -p 'MYPASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t elucero@$i 'echo 'MYPASSWORD' | sudo -S uptime'

EC=`echo $?`
if [[ $EC == "0" ]];then
MSG="Uptime Successful"
else
MSG="Uptime Failed"
fi
echo -e "Checking $H,$i,ec=$EC,$MSG"
done
