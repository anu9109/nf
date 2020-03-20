#######################################################
# Dockerfile
#
# Description:	 Testing out various ways to use Nextflow including using all software
#		 for a pipeline from a Docker image.
# Base image: 	 ubuntu:18.04
#######################################################

# Set base image
FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y \
  git \
  autoconf \
  curl \
  gcc \
  make \
  gawk \
  g++ \
  perl \
  pkg-config \
  zlib1g-dev \
  wget \
  libncurses5-dev \
  libcurl4-gnutls-dev \
  libssl-dev \
  libexpat1-dev \
  libgd-gd2-perl \
  cpanminus \
  build-essential \
  libgd-dev \
  nettle-dev \
  bioperl \
  r-base \
  r-base-dev \
  r-cran-xml \
  libxml2-dev \
  python-pip \
  texlive-full \
  nano \
  default-jre \
  default-jdk && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# create /opt/software
RUN mkdir -p /opt/software

# install FASTQC
RUN cd /opt/software && \
  wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
  unzip fastqc_v0.11.9.zip && \
  cd FastQC/ && \
  chmod 755 fastqc && \
  rm /opt/software/fastqc_v0.11.9.zip

ENV PATH=$PATH:/opt/software/FastQC

  


