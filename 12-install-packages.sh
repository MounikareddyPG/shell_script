#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

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
dnf list installed  $i &>>$LOGFILE
   if [ $? -eq 0 ]
     then 
   echo "$i already installed...SKIPPING"
   else
     echo "$i not installed..Need to install"

     fi
done 
