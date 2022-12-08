FROM osgeo/gdal:ubuntu-small-3.6.0
LABEL desc="Docker image with GDAL and rasterio for use with the GFW data API"
LABEL version="v1.1.10"

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y postgresql-client python3-pip jq curl zip g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
        awscli~=1.27.9 \
        awscli-plugin-endpoint~=0.4 \
        boto3~=1.26.9 \
        csvkit~=1.0.7 \
        fiona~=1.8.22 \
        rasterio~=1.3.4 \
        tileputty~=0.2.10

RUN ln -s /usr/include /usr/include/gdal