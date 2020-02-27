FROM python:alpine as V1

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

ARG DOCKER_TAG

ENV PYTHONIOENCODING=UTF-8

RUN apk add --update --no-cache jq bash

RUN if [[ "$DOCKER_TAG" == "1"* ]]; then \
      pip --no-cache-dir install awscli==$DOCKER_TAG; \
    else \
      pip --no-cache-dir install awscli; \
    fi


FROM amazonlinux:2 as V2

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

ARG DOCKER_TAG

RUN yum update -y > /dev/null \
    && yum install -y unzip jq > /dev/null

RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip > /dev/null \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -rf aws

