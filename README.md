# README

Rails 5 sample app to play with the ruby-kafka gem.
It is fully containerized, see available services in the
[docker-compose.yml](docker-compose.yml)

Setup git hooks in your environment:
```
git config core.hooksPath .githooks
```

## Setup kafka:
Start all services:
```
docker-compose up --build -d
```
Create a topic:
```
docker container exec kafka kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181
```
List topics:
```
docker container exec kafka kafka-topics --describe --zookeeper zookeeper:2181
```
Publish data to topic with console producer:
```
docker container exec kafka bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list kafka:9092 --topic foo && echo 'Produced 42 messages.'"
```
Consume messages with console consumer:
```
docker container exec kafka kafka-console-consumer --bootstrap-server kafka:9092 --topic foo --from-beginning --max-messages 42
```
Produce events from rails app:
```
docker-compose up -d
```
Visiting 'localhost:3000' produces an event in the topic "page_visits" in kafka
