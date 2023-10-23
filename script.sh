#!/usr/bin/env sh

podman run -it --rm --name homework-db -e POSTGRES_PASSWORD=mysecretpassword -v ./initdb:/docker-entrypoint-initdb.d -p 8080:5432 postgres
