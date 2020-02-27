FROM amazonlinux:2

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

ARG AWS_CLI_VERSION

RUN yum update -y > /dev/null \
    && yum install -y unzip jq > /dev/null

RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip > /dev/null \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -rf aws
