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


dnf install mysql-server -y &>>$LOGFILE
VALIDATE &? "install Mysql server"

Systemctl enable mysqld &>>$LOGFILE
VALIDATE &? "enable mysql server"

Systemctl start mysqld &>>$LOGFILE
VALIDATE &? "start mysqlserver"

mysql-secure-installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE &? "setting up root password"
