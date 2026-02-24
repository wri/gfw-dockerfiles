FROM ubuntu:noble

ENV TERRAFORM_VERSION="0.13.3"
ENV PYTHONUNBUFFERED=1

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends --no-install-suggests  \
        apt-transport-https \
        ca-certificates \
        curl \
        docker.io \
        git \
        gnupg \
        lsb-release \
        make \
        python3 \
        python-is-python3 \
        unzip && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests terraform=${TERRAFORM_VERSION} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    rm -rf /var/cache/apt

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip

COPY terraform_scripts/* /usr/local/bin/
