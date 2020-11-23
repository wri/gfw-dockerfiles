#1.1.3
FROM osgeo/gdal:ubuntu-small-3.2.0

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y postgresql-client-12 python3-pip jq curl zip g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
        csvkit~=1.0.5 \
        awscli~=1.18.180 \
        fiona~=1.8.17 \
        rasterio~=1.1.8 \
        boto3~=1.16.19 \
        awscli-plugin-endpoint~=0.4 \
        tileputty~=0.2.4

RUN ln -s /usr/include /usr/include/gdal