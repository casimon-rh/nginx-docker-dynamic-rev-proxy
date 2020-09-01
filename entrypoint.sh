#!/bin/bash
STOP_PROC=0;
trap "docker_stop" SIGINT SIGTERM

function docker_stop {
    export STOP_PROC=1;
}
cat /usr/src/app/baseServer.conf > /etc/nginx/conf.d/main.conf
if  [ ! -z "$ENDPOINTS" ] ; then
  LIST=$(echo $ENDPOINTS | tr ";" "\n")
  for ENDPOINT in $LIST
  do
    LOCATION="$(echo $ENDPOINT | awk -F '=' '{print $1}')"
    PASS="$(echo $ENDPOINT | awk -F '=' '{print $2}')"
    cat /usr/src/app/baseLocation.conf | sed -r -e "s~^( *location).*~\1 $LOCATION \{~" -e "s~^( *proxy_pass).*~\1 $PASS;~" >> /etc/nginx/conf.d/main.conf
  done
fi
echo "}" >> /etc/nginx/conf.d/main.conf
cat /etc/nginx/conf.d/main.conf
nginx -T
nginx
## Debug
echo "OK"

EXIT_DAEMON=0

while [ $EXIT_DAEMON -eq 0 ]; do
    if [ $STOP_PROC != 0 ]
    then
        break;
    fi
    sleep 5
done
