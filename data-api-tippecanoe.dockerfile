# Version 1.2.2

FROM python:3.8-slim

ENV TIPPECANOE_VERSION=1.36.0

# Update repos and install dependencies
RUN apt-get update \
  && apt-get --no-install-recommends -y install build-essential curl libsqlite3-dev zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install TippeCanoe
RUN mkdir -p /opt/src
WORKDIR /opt/src
RUN curl https://codeload.github.com/mapbox/tippecanoe/tar.gz/${TIPPECANOE_VERSION} | tar -xz
WORKDIR /opt/src/tippecanoe-${TIPPECANOE_VERSION}
RUN make && make install
RUN rm -R /opt/src/tippecanoe-${TIPPECANOE_VERSION}

# Install python dependencies
RUN pip install \
        tileputty~=0.2.8 \
        awscli~=1.18.215 \
        awscli-plugin-endpoint~=0.4
