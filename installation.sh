#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "Error:: Please run this script using root access"
   exit 1
fi

validate(){
if [ $1 -ne 0 ]; then
   echo "ERROR: Installing $2 is failure"
   exit 1
else
   echo "Installing $2 is success"
fi
}

dnf install mysql -y
  validate $? "Mysql"

dnf install nginx -y
  validate $? "nginx"