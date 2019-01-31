#!/bin/sh
for N in `seq 50 54`
do
  echo "create node${N} ... "
##################   
docker run --rm -d --hostname node"${N}" --name node"${N}" \
  --net=net77 --ip 172.77.77."${N}" \
  -v `pwd`:/vms \
  -v `pwd`/conf:/kafka/conf:ro \
  -v /app/jdk180:/jdk180:ro \
  -v /ram/"${N}":/kafka/logs \
  -e KAFKA_HOME=/kafka \
  pcific/mykafka \
  sleep 5.77h
##################   
done
echo --------------------------------
docker ps -a
echo --------------------------------
ping -q -c 1 node50 |grep bytes 
ping -q -c 1 node51 |grep bytes
echo --------------------------------

