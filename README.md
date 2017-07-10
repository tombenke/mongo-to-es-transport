mongo-to-es-transporter
=======================

## About

This is a docker image, which includes a Compose / Transporter application 
with a predefined, parametric pipeline definition.

The predefined pipeline migrates the current state of a MongoDB database into Elasticsearch,
and then continues with syncing the changes too.

    +---------+     +-------------+     +---------------+
    | mongodb |---->| transporter |---->| elasticsearch |
    +---------+     +-------------+     +---------------+

See also the [mongo-bi]( "https://github.com/tombenke/mongo-bi") project as an example, how to use this image.

## Build

The configuration parameters for build:

- `TRANSPORTER_VERSION`: The version of the transporter to use. Default is `0.4.0-rc.1`.
- `TRANSPORTER_PLATFORM`: The platform the transporter was built. Default is `linux-amd64`.

See also [the transporter releases](https://github.com/compose/transporter/releases/tag/v0.4.0-rc.1)
for further details on versions and platforms.

Build the image with the default configuration:

    docker build -t tombenke/mongo-to-es-transporter:latest .

Build the image with different versions and/or platforms:

    export TRANSPORTER_VERSION=<version>
    export TRANSPORTER_VERSION=<platform>
    docker build -t tombenke/mongo-to-es-transporter:latest .


## Run

The configuration parameters for run:

- `DB_NAME`: The name of the database to transport from MongoDb to ES.
  It is also the name of the index will be created on ES. Default: `test`.
- `MONGODB_URI`: The full URI of the MongoDb server, including credentials, if there is any.
  Use one of the following formats: `mongodb://<user>:password@host:port` or `mongodb://host:port`.
  Default: `mongodb://localhost:27017`.
- `ELASTICSEARCH_URI`: The full URI of the Elasticsearch server, including credentials if there is any.
  Use one of the following formats: `http://<user>:password@host:port` or `http://host:port`.
  Default: `http://localhost:9200`.

    docker run -it --rm tombenke/mongo-to-es-transporter:latest


## References
- [Elasticsearch: The Definitive Guide 2.x](https://www.elastic.co/guide/en/elasticsearch/guide/current/index.html)
- [5 ways to synchronize data from MongoDb to ElasticSearch](https://www.linkedin.com/pulse/5-way-sync-data-from-mongodb-es-kai-hao)
- [compose/transporter](https://github.com/compose/transporter/)

