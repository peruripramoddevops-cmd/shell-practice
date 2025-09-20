#!bin/bash

START_TIME = $(date +%s)

sleep 10

END_TIME = $(date +%s)
TOTAL = $((START_TIME+END_TIME))

echo "Total time is $TOTAL seconds"