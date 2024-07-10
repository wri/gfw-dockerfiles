FROM python:3.12-slim
LABEL desc="Docker image with Tippecanoe for use with the GFW data API"
LABEL version="v1.3.1"

ENV TIPPECANOE_VERSION=2.55.0
ENV VENV_DIR="/.venv"

# Update repos and install dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y python3-venv \
        build-essential curl libsqlite3-dev zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install TippeCanoe
RUN mkdir -p /opt/src
WORKDIR /opt/src
RUN curl https://codeload.github.com/felt/tippecanoe/tar.gz/${TIPPECANOE_VERSION} | tar -xz \
    && cd /opt/src/tippecanoe-${TIPPECANOE_VERSION} \
    && make \
    && make install \
    && rm -R /opt/src/tippecanoe-${TIPPECANOE_VERSION}

# Set WORKDIR back to the default
WORKDIR /

# Install python dependencies
RUN python -m venv ${VENV_DIR} --system-site-packages \
    && . ${VENV_DIR}/bin/activate \
    && python -m ensurepip --upgrade \
    && python -m pip install \
        awscli~=1.33.13 \
        awscli-plugin-endpoint~=0.4 \
        tileputty~=0.2.10