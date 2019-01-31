
my kafka cluster docker image 

wget http://mirror.navercorp.com/apache/kafka/2.1.0/kafka_2.11-2.1.0.tgz

docker network create --driver=bridge --subnet=172.77.77.0/24 net77

docker exec -it node50 bash
docker exec -d node50 bin/zookeeper-server-start.sh -daemon conf/zookeeper.properties
docker exec -d node51 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=1 
docker exec -d node52 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=2 
docker exec -d node53 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=3 
docker exec -d node54 bin/kafka-server-start.sh -daemon conf/server.properties -override broker.id=4 

run bin/kafka-topics.sh --list --zookeeper node50:2181
run bin/kafka-topics.sh --create --zookeeper node50:2181 --replication-factor 1 --partitions 1 --topic mytest

run bin/kafka-console-producer.sh --broker-list node51:9092,node52:9092,node53:9092,node54:9092 --topic mytest
run bin/kafka-console-consumer.sh --bootstrap-server node52:9092 --topic mytest --from-beginning
 
run bin/kafka-topics.sh --create --zookeeper node50:2181 --replication-factor 3 --partitions 1 --topic myrepl
run bin/kafka-topics.sh --describe --zookeeper node50:2181 --topic myrepl

run bin/kafka-console-producer.sh --broker-list node53:9092 --topic myrepl
run bin/kafka-console-consumer.sh --bootstrap-server node53:9092 --topic myrepl --from-beginning




