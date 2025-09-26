#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}


LOGS_FOLDER="var/logs/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log 

mkdir -p $LOGS_FOLDER
echo "Scrpit started creating at: $date" | tee -a $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
       echo "ERROR:: Please run this code with root preivelge"
       exit 1
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
     USAGE
fi     


if [ ! -d $SOURCE_DIR ]; then
   echo -e "$R ERROR:: $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$R ERROR:: $DEST_DIR does not exist $N"
   exit 1
fi

FILES=$(find $SOUCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "{FILES}" ]; then
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "ZIP file name: $ZIP_FILE_NAME"
    find $SOUCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archeival ... $G SUCCESS $N"

        ### Delete if success ###
        while IFS= read -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES
    else
        echo "Archieval ... $R FAILURE $N"
        exit 1
    fi
else
    echo -e "No files to archeive ... $Y SKIPPING $N"
fi