FROM ubuntu:20.04

MAINTAINER Ricardo Merces

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive TZ='America/Sao_Paulo' apt-get -y install tzdata && \
    apt-get install -y \
    vim \
    curl \
    wget \
    git \
    iputils-ping \
    traceroute \
    netcat \
    telnet \
    dnsutils \
    unzip

RUN curl -fsSL https://get.docker.com | bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && rm -f kubectl

RUN apt-get clean -y

CMD "/bin/bash"
