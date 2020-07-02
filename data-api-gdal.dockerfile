FROM osgeo/gdal:ubuntu-small-latest

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y postgresql-client-12 python3-pip jq curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
        csvkit~=1.0.5 \
        awscli~=1.18.74 \
        fiona~=1.8.13 \
        rasterio~=1.1.5 \
        boto3~=1.13.24 \
        awscli-plugin-endpoint~=0.3