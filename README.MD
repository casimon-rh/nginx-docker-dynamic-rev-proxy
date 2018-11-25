# Nginx Docker with dynamic reverse proxy and NODE JS

Simple nginx docker image, handles dynamically multiple reverses proxys.

## REQUIREMENTS

Node scripts: _run_ & _build_

## MODES

* PRODUCTION
* DEVELOPEMENT

## ENVS

* PORT:
  
  nodejs port by default, could be 4200, 3000, 3001, etc.
* ENDPOINTS:
  > /`location`=`http://host:port/app`

## Usage

1. Copy html, js and css resources to base directory
2. Compile docker `sudo docker build -t name .`
3. Run docker and add reverse proxies `sudo docker run -e 'ENDPOINTS=/location=http://host:port/app' -e 'PORT=3000' -e 'PROD=true' -n container -d name`

## Tip

> Use **docker network** to handle multiple _docker-hosts_ and avoid unnecesary port exposition.

## Warning

NodeJS compilation takes about half an hour :anguished:

## TODO

Improve security and headers to reverse proxies' locations.

Improve docker merge Node & Nginx