FROM python:3.8-alpine

WORKDIR /ansible

RUN apk --no-cache add \
        bash \
        openssh-client \
        openssl \
        py-pip \
        sshpass \
        build-base \
        libffi-dev \
        nano

RUN pip install ansible