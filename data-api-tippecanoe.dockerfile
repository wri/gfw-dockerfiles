FROM python:3.10-slim
LABEL desc="Docker image with Tippecanoe for use with the GFW data API"
LABEL version="v1.2.3"

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
        awscli~=1.27.9 \
        awscli-plugin-endpoint~=0.4 \
        tileputty~=0.2.10