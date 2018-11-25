# Nginx Docker with dynamic reverse proxy

Simple nginx docker image, handles dynamically multiple reverse proxies.

## ENVS

- ENDPOINTS:
  > /location=http://host:port/app;/location1=http://host1:port/app1

## Usage

1. Copy html, js and css resources to base directory
2. Compile docker `sudo docker build -t name .`
3. Run docker and add reverse proxies `sudo docker run -e 'ENDPOINTS=/location=http://host:port/app;/location1=http://host1:port/app1' -n container -d name`

## Tip

> Use **docker network** to handle multiple _docker-hosts_ and avoid unnecesary port exposition.

## TODO

Improve security and headers to reverse proxies' locations.
