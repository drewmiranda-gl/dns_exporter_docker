# What is this?

This is a repository used to build a docker image of [dns_exporter](https://github.com/tykling/dns_exporter)

# What exactly is this doing?

* builds a docker image from `ubuntu:22.04`
* Installs python3 and pip3
* Uses pip to install [dns_exporter](https://github.com/tykling/dns_exporter) (`pip install dns_exporter`)
* Changes the HTTPServer bind address from `127.0.0.1` to `0.0.0.0`

# How do I use this?

## Build image using Docker Build

```sh
docker build -t dns_exporter:latest .
```

## Run using Docker Compose

```sh
docker compose -f DockerCompose.yml up -d --build
```