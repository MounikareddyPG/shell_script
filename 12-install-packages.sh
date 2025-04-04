#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE (){
    if [ $1 -ne 0 ]
    then 
      echo "$2...FAILURE"
      exit 1
    else 
       echo "$2..SUCCESS"
    fi
    }
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
       dnf install  $i -y &>>$LOGFILE
       VALIDATE $? "installtion of $i"
    fi
done 
