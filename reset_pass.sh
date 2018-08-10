#!/bin/bash
for i in `cat css | awk '{print $1}'`
for i in `cat list | awk '{print $2}'`
do

sshpass -p 'MYPASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t elucero@$i '
echo 'MYPASSWORD' | sudo -S /sbin/pam_tally2 -u USERNAME --reset; echo 'MYPASSWORD' | sudo -S /usr/sbin/usermod -U USERNAME; echo -e 
"chang3m3\nchang3m3" | sudo -S passwd USERNAME'
 EC=`echo $?`
if [[ $EC == "0" ]];then
 MSG="Login OK"
 else
 MSG="Login Failed"
 fi
 echo -e "Checking $H,$i,ec=$EC,$MSG"
 done
