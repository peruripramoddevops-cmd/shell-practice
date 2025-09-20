#!bin/bash

echo "Script name $0"
echo "Current Directory $PWD"
echo "who is running this $USER"
echo "Home Directory $HOME"
echo "PID of this script $$"

sleep 50 &

echo "PID of last command is background is :$!"