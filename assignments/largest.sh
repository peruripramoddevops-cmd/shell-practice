#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "usage: $0 <num1. <num2>"
    exit 1
fi

largest=$1

for number in "$@"; do

   if [[ $number -gt $largest ]]; then
       largest=$number 
   fi
done

echo "Largest number is: $largest"