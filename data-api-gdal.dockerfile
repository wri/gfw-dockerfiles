FROM ghcr.io/osgeo/gdal:ubuntu-full-3.8.5
LABEL desc="Docker image with GDAL and rasterio for use with the GFW data API"
LABEL version="v1.2.1"

ENV VENV_DIR="/.venv"

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y python3-venv \
        postgresql-client jq curl zip g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# --system-site-packages is needed to copy the GDAL Python libs into the venv
RUN python -m venv ${VENV_DIR} --system-site-packages \
    && . ${VENV_DIR}/bin/activate \
    && python -m ensurepip --upgrade \
    && python -m pip install \
        awscli~=1.33.13 \
        awscli-plugin-endpoint~=0.4 \
        boto3~=1.34.128 \
        csvkit~=2.0.0 \
        earthengine-api~=0.1.408 \
        fiona~=1.9.6 \
        rasterio~=1.3.10 \
        tileputty~=0.2.10

RUN ln -s /usr/include /usr/include/gdal