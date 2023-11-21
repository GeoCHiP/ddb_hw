#!/usr/bin/env sh

set -xeuo pipefail

podman run -it --rm --name homework-db -e POSTGRES_PASSWORD=123 -e POSTGRES_USER=admin -e POSTGRES_DB=hotels -v ./initdb:/docker-entrypoint-initdb.d -p 8080:5432 postgres
