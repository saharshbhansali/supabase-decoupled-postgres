#!/bin/sh

cp .env.example .env

echo "example env copied"

docker network create testnet

echo "Separate docker network created"

docker compose -f ./docker-compose.externaldb.yml up -d

echo "External Postgres Database Up"

echo "Sleeping... 15s"

sleep 15s

echo "Starting other services"

docker compose -f ./docker-compose.yml up -d

echo "Done!"
