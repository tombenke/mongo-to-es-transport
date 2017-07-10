#!/bin/bash

# Waits for the mongodb service then waits for the elasticsearch service, then starts the transporter
# The services are tested via trying to connect to the host and port defined by the environment variables.

IFS=':/@' URI=($ELASTICSEARCH_URI)
len="${#URI[@]}"
export EPORT=${URI[$len-1]}
export EHOST=${URI[$len-2]}

IFS=':/@' URI=($MONGODB_URI)
len="${#URI[@]}"
export MPORT=${URI[$len-1]}
export MHOST=${URI[$len-2]}

echo "Waiting for ${MHOST}:${MPORT} service..." && \
    ./wait-for.sh "$MHOST:$MPORT" -t 60 -- \
    echo "Waiting for ${EHOST}:${EPORT} service..." && \
    ./wait-for.sh "$EHOST:$EPORT" -t 60 -- \
    transporter run -log.level "info" pipeline.js
