FROM ubuntu:22.04

USER root

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get --no-install-recommends install python3 python3-pip curl gnupg lsb-release -y \
    && python3 -m pip install dns_exporter \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/lib/python3/dist-packages/wheel \
    && rm -rf /usr/lib/python3/dist-packages/wheel-0.37.1.egg-info \
    && sed -i 's|127.0.0.1|0.0.0.0|g' /usr/local/lib/python3.10/dist-packages/dns_exporter/entrypoint.py

EXPOSE 15353

CMD [ "/usr/local/bin/dns_exporter" ]

# Optionall use a config file
# CMD [ "/usr/local/bin/dns_exporter", "-c", "/dns_exporter.yml" ]
