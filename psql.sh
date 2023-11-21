#!/usr/bin/env sh

set -xeuo pipefail

podman exec -it homework-db psql --host localhost --username admin --dbname hotels
