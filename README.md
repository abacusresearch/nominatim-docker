# Nominatom Docker

Run [http://wiki.openstreetmap.org/wiki/Nominatim](http://wiki.openstreetmap.org/wiki/Nominatim) in a docker container.

# Usage

```
docker pull nisaacson/nominatim-docker
```

# Building

To rebuild the image locally execute

```
docker build -t nominatim .
```

# Running

By default the container exposes port `80` To run the container execute

```
# remove any existing containers
docker rm -f nominatim_container || echo "nominatim_container not found, skipping removal"
docker run -p 80:80 --name nominatim_container --detach nomintatim
```

Check the logs of the running container

```
docker logs nominatim_container
```

Connect to the nominatim webserver with curl. If this succeeds, open [http://localhost:80/](http:/localhost:80) in a web browser

```
curl "http://localhost:80"
```
