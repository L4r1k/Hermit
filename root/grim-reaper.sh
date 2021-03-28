#!/bin/bash
# Reaper script to kill php reverse shells and system wide grepping

while true
do
    ps aux | grep php | awk '{print $2}' | xargs kill -9 > /dev/null 2>&1
    ps aux | grep grep | awk '{print $2}' | xargs kill -9 > /dev/null 2>&1
    sleep 30
done &

PID=$!
echo $PID > /root/reaperPID.txt