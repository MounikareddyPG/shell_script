#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
   echo "please run this script with root access"
   exit 1 #manually exit
else
   echo "you are super user"
fi



dnf install mysqll -y

if [ $? -ne 0 ]
then 
  echo "installation of mysql...FAILURE"
  exit 1
fi

dnf install git -y


echo "Is script proceeding?"