#!/bin/bash                                                   
for i in `cat list | awk '{print $2}'`                                          
do
sshpass -p 'MYPASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t  elucero@$i '
echo 'MYPASSWORD' | sudo -S reboot'

EC=`echo $?`
if [[ $EC == "0" ]];then
MSG="Login OK"
else
MSG="Login Failed"
fi
echo -e "Checking $H,$i,ec=$EC,$MSG"
done
