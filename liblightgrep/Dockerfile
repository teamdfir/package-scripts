ARG OS_VERSION=22.04
FROM ubuntu:$OS_VERSION

ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

RUN \
  apt-get update && \
  apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y debhelper python-all python-setuptools devscripts quilt ant autotools-dev dh-autoreconf software-properties-common git libboost-all-dev libicu-dev bison pkg-config

WORKDIR /opt

ENV DEBFULLNAME "Erik Kristensen"
ENV DEBEMAIL "erik@erikkristensen.com"
ENV DISTRIBUTION focal
ENV PRIORITY low
ENV VERSION 1.4.1-1sift1
ENV GIT_URL https://github.com/strozfriedberg/liblightgrep.git
ENV GIT_TAG 3eed03a5b6698a09f5d08e2b686d9d03d96fa4c2
ENV PPA dev
ENV PROJECT liblightgrep

ADD build-source.sh /opt/build-source.sh
ADD upload-source.sh /opt/upload-source.sh
ADD build-package.sh /opt/build-package.sh
ADD sift.asc /opt/sift.asc
COPY debian /opt/debian

CMD ["bash", "upload-source.sh"]
