#!/bin/sh
docker exec -d node50 bin/zookeeper-server-start.sh -daemon conf/zookeeper.properties
sleep 5
docker exec -d node51 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=1 
docker exec -d node52 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=2 
docker exec -d node53 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=3 
docker exec -d node54 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=4 

