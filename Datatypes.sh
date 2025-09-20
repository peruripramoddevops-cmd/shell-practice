#!/bin/bash

NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo "sum is $SUM"

Echo "Below are array ones"

LIST=("modi","trump","CBN")

echo "ALL LEADERS are ${LIST[@]}"
echo "Telugu leader is ${LIST[2]}"
