#!/bin/bash  
#This script is to set password expiry to max days
for i in `cat list | awk '{print $2}'`                                          
do
#MYPASSWORD refers to my own password 
#USERNAME1 is my username. USERNAME2 is the username of the account you are attempting to unlock
sshpass -p 'MYPASSWORD' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t  USERNAME1@$i '
echo 'MYPASSWORD' | sudo -S /usr/bin/chage -I -1 -m 0 -M 99999 -E -1 USERNAME2'
 EC=`echo $?`
if [[ $EC == "0" ]];then
 MSG="Login OK"
 else
 MSG="Login Failed"
 fi
 echo -e "Checking $H,$i,ec=$EC,$MSG"
 done
