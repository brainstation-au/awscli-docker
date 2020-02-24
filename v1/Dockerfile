FROM python:alpine

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

ENV PYTHONIOENCODING=UTF-8

RUN apk add --update --no-cache jq bash

ARG AWS_CLI_VERSION

RUN if [[ "$AWS_CLI_VERSION" == "latest" ]]; then pip --no-cache-dir install awscli; else pip --no-cache-dir install awscli==$AWS_CLI_VERSION; fi
