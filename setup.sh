#!/bin/sh

docker network create testnet

docker compose -f ./docker-compose.externaldb.yml up -d

sleep 15s

docker compose -f ./docker-compose.yml up -d
