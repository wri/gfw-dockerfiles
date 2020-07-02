FROM hashicorp/terraform:0.12.26

RUN \
    apk add --no-cache \
        bash \
        make \
        python3 \
        zip \
        docker \
        openrc \
        go \
    && pip3 install awscli==1.18.80

RUN rc-update add docker boot
RUN GO111MODULE="on" go get github.com/segmentio/terraform-docs@v0.9.1
ENV GOPATH=~/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

COPY terraform_scripts/* /usr/local/bin/