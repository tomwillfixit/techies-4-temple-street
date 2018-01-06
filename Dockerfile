#Staight up copy from https://github.com/alexellis/mine-with-docker

FROM ubuntu:xenial

ENV worker_label t4ts

WORKDIR /root/

RUN apt-get update && apt-get -qy install \
 automake \
 build-essential \
 libcurl4-openssl-dev \
 libssl-dev \
 git \
 ca-certificates \
 libjansson-dev libgmp-dev g++ --no-install-recommends


RUN git clone --recursive https://github.com/JayDDee/cpuminer-opt cpuminer-multi
WORKDIR /root/cpuminer-multi

RUN ./autogen.sh
RUN CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl

RUN make

# Hardcoded args and bitcoin wallet in here. Not great but in a rush.

CMD ./cpuminer -a cryptonight -o stratum+tcp://cryptonight.eu.nicehash.com:3355 -u 1KW1jDtPrFDn4QCedtJgSsAz4BmtLN7ma.${worker_label} 
