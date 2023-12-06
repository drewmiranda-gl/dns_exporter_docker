#!/bin/bash
#       MAC
# ./build.sh
# 
#       LINUX
# sudo bash build.sh
# 

get_os() {
    osname=""

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
        osname="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        osname="macos"
    fi
}
get_os
echo $osname

echo removing exsitng docker images: dns_exporter
# remove existing images - keep exported image size under control, keep from growing
if [[ "$osname" == "macos" ]]; then
    docker images dns_exporter -q | awk '{print $3}' | xargs docker image rm --force
elif [[ "$osname" == "linux" ]]; then
    sudo docker images dns_exporter -q | awk '{print $3}' | sudo xargs docker image rm --force
fi
# buid image
docker build -t dns_exporter:latest .

