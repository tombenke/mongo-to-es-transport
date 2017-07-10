#!/bin/bash

docker run --rm \
           --net="host" \
           -e DB_NAME=${DB_NAME} \
           -e MONGODB_URI=${MONGODB_URI} \
           -e ELASTICSEARCH_URI=${ELASTICSEARCH_URI} \
           -it tombenke/mongo-to-es-transporter:latest

