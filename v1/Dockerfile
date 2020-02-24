FROM python:alpine

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

ENV PYTHONIOENCODING=UTF-8

RUN apk add --update --no-cache jq bash

ARG AWS_CLI_VERSION

RUN pip --no-cache-dir install awscli
