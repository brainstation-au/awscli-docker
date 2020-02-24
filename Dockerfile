FROM amazonlinux:2

LABEL maintainer="brainstation<brainstation@outlook.com.au>"

RUN yum update -y && yum install -y unzip jq

RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip
