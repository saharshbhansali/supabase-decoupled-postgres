#!/bin/sh

cp .env.example .env

echo "Example .env copied."

docker network create testnet

echo "Separate docker network created."

docker compose -f ./docker-compose.externaldb.yml up -d

echo "External Postgres database running."

echo "Sleeping... 15s."

sleep 15s

echo "Starting other services:"

docker compose -f ./docker-compose.yml up -d

echo "Done\!"

echo "Run:"

echo "docker compose -f ./docker-compose.yml down && docker compose -f ./docker-compose.externaldb.yml down"

echo "to stop the active docker services"

echo "Debug using: docker compose [attach|logs] <service-name>"
