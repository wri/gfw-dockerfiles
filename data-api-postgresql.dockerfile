FROM python:3.10-slim
LABEL desc="Docker image with PostgreSQL client for use with the GFW data API"
LABEL version="v1.0.3"

# Update repos and install dependencies
RUN apt-get update \
  && apt-get --no-install-recommends -y install postgresql-client jq curl libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install \
        asyncpg~=0.25.0 \
        awscli~=1.27.9 \
        awscli-plugin-endpoint~=0.4 \
        boto3~=1.26.9 \
        click~=8.1.3 \
        csvkit~=1.0.7 \
        pandas~=1.5.1 \
        psycopg2-binary~=2.9.5 \
        shapely~=1.8.5 \
        SQLAlchemy~=1.3.24