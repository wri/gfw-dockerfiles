FROM hashicorp/terraform:1.0.11
LABEL version="v1.4.2"

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
    && pip3 install awscli==1.27.153

RUN rc-update add docker boot

COPY terraform_scripts/* /usr/local/bin/