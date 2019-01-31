#!/bin/sh

echo kill java ...
PID=`ps -ef|grep java|grep kafka|grep -v grep|awk '{print $2}'`
[ -n "$PID" ] && sudo kill $PID
sleep 3
echo -------------------------
ps -ef|grep java|grep kafka|grep -v grep 
echo -------------------------
echo docker stop ...
docker stop node51 node52 node53 node54
docker stop node50
echo -------------------------
docker ps -a
echo -------------------------

