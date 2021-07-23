FROM hashicorp/terraform:0.14.11
LABEL version="v1.3.0"

ENV TERRAFORM_DOCS_VERSION=0.14.1

RUN \
    apk add --no-cache \
        bash \
        make \
        python3 \
        zip \
        docker \
        openrc \
        curl \
        py3-pip \
    && pip3 install awscli==1.20.5

RUN rc-update add docker boot

RUN curl -Lo ./terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-$(uname | tr '[:upper:]' '[:lower:]')-amd64 \
    && chmod +x ./terraform-docs \
    && mv ./terraform-docs /usr/local/bin/terraform-docs

COPY terraform_scripts/* /usr/local/bin/