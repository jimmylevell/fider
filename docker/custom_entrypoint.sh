#!/bin/ash

# call docker secret expansion in env variables
source /docker/set_env_secrets.sh

/bin/sh -c ./fider migrate && ./fider
