############This script is designed to add users to multiple Linux servers(the -p PASSWORDINAD is for AD authenticated accounts. Please make
sure to include the file "list" which has a list of all the servers the user needs to be added to################

#MY script starts here!!
#!/bin/bash                                                   
for i in `cat list | awk '{print $2}'`                                          
do

sshpass -p 'mypassword' ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=5 -t  myusername@$i '
echo 'mypassword' | sudo -S /usr/sbin/useradd -c "firstname lastname" -u UID -m -d /home/USERNAME -m -G GROUP -s /bin/bash 
-p PASSWORDINAD USERNAME'



EC=`echo $?`
if [[ $EC == "0" ]];
then

MSG="Login OK"
else
MSG="Login Failed"

fi

echo -e "Checking $H,$i,ec=$EC,$MSG"
done
