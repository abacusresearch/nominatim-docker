#!/bin/sh
docker rm nominatim-importer

sudo rm -Rf /data/nominatim-psql
sudo mkdir -p /data/nominatim-psql
sudo chattr -R +C /data/nominatim-psql

docker run --rm -v /data/nominatim-psql:/var/lib/postgresql --name nominatim-importer nominatim-base ./setup_psql.sh

#docker run --rm -v /data/nominatim-psql:/var/lib/postgresql --name nominatim-importer nominatim-base ./configPostgresql.sh dw

docker run -v /data/nominatim-psql:/var/lib/postgresql --name nominatim-importer -d -v /data/pbf/planet-latest.osm.pbf:/app/data.pbf nominatim-base sh -c "service postgresql start &&  sudo -u nominatim ./utils/setup.php --osm-file /app/data.pbf --all --threads 12 --osm2pgsql-cache 32000 $@"

docker attach nominatim-importer
