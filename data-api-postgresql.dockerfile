FROM python:3.8-slim

# Update repos and install dependencies
RUN apt-get update \
  && apt-get --no-install-recommends -y install postgresql-client jq curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install \
        csvkit~=1.0.5 \
        awscli~=1.18.117 \
        boto3~=1.14.40 \
        awscli-plugin-endpoint~=0.4 \
        click~=7.1.2 \
        psycopg2-binary~=2.8.5 \
        asyncpg~=0.21.0 \
        SQLAlchemy~=1.3.18 \
        pandas~=1.1.0 \
        shapely~=1.7.0