FROM python:3.12-slim
LABEL desc="Docker image with PostgreSQL client for use with the GFW data API"
LABEL version="v1.1.0"

ENV VENV_DIR="/.venv"

# Update repos and install dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y python3-venv python3-dev \
        postgresql-client jq curl libpq-dev gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN python -m venv ${VENV_DIR} \
    && . ${VENV_DIR}/bin/activate \
    && python -m ensurepip --upgrade \
    && python -m pip install \
        asyncpg~=0.29.0 \
        awscli~=1.33.13 \
        awscli-plugin-endpoint~=0.4 \
        boto3~=1.34.128 \
        click~=8.1.7 \
        csvkit~=1.0.5 \
        numpy~=1.26.4 \
        "pandas<2.2" \
        psycopg2~=2.9.9 \
        setuptools~=70.1 \
        shapely~=2.0.4 \
        SQLAlchemy~=1.3.24