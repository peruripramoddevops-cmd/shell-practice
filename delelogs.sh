#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="var/logs/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log 

mkdir -p $LOGS_FOLDER
echo "Scrpit started creating at: $date" | tee -a $LOGS_FOLDER

SOURCE_DIR=/home/ec2-user/app-logs

if [ ! -d $SOURCE_DIR ]; then
   echo -e "ERROR:: $SOURCE_DIR does not exist"
   exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= -r filepath
do
 echo "deleting the file: $filepath"
 rm -rf $filepath
 echo "deleted the file: $filepath"
done << $FILES_TO_DELETE
