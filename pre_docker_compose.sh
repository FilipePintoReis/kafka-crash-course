#!/bin/bash

# Remove files or directories from the host machine
echo "Removing Kafka data and controller logs..."

rm -rf ./controller-logs
rm -rf ./kafka-logs
mkdir ./controller-logs
mkdir ./kafka-logs

# Start Docker Compose
docker compose down
docker compose up --build