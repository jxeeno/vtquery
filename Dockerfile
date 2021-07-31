FROM ubuntu:16.04

RUN apt-get update -y && \
 apt-get install -y build-essential bash curl git-core ca-certificates software-properties-common vim python-software-properties --no-install-recommends

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update -y


RUN curl https://nodejs.org/dist/v14.17.4/node-v14.17.4-linux-arm64.tar.xz | tar zxC /usr/local --strip-components=1

ENV PATH=/usr/local/src/mason_packages/.link/bin:${PATH} CXX=clang++
WORKDIR /usr/local/src
COPY ./ ./

RUN make
