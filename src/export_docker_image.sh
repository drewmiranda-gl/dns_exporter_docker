#!/bin/bash

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

if [[ "$osname" == "macos" ]]; then
    docker save dns_exporter:latest -o dns_exporter-docker-image_$(uname -m).tar
elif [[ "$osname" == "linux" ]]; then
    sudo docker save dns_exporter:latest > dns_exporter-docker-image_$(uname -m).tar
fi
