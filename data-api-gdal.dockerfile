#1.1.7
FROM osgeo/gdal:ubuntu-small-3.5.1

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y postgresql-client-12 python3-pip jq curl zip g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
        csvkit~=1.0.7 \
        awscli~=1.25.44 \
        fiona~=1.8.21 \
        rasterio~=1.3.0 \
        boto3~=1.24.44 \
        awscli-plugin-endpoint~=0.4 \
        tileputty~=0.2.8

RUN ln -s /usr/include /usr/include/gdal
