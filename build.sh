#!/bin/sh

docker rmi pcific/mykafka
docker rmi `docker images pcific/mykafka -q`

TSTMP=`date "+%y%m%d%H%M"`
echo $TSTMP 
docker build -t pcific/mykafka:$TSTMP -f Dockerfile.mykafka .
docker tag pcific/mykafka:$TSTMP pcific/mykafka
echo ----------------------------
docker images pcific/mykafka
echo ----------------------------

