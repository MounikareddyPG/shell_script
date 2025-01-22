#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]

then 
   echo "please run this script with root access"
   exit 1 #manually exit
else
   echo "you are super user"
fi

#echo "all packages:$@"

for i in $@
do 
echo "install package : $i"
done

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "setting up root password" 