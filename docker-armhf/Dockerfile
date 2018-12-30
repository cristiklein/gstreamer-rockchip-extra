FROM debian:stretch-slim

RUN dpkg --add-architecture armhf

RUN \
    apt-get update \
    && apt-get -y install \
        crossbuild-essential-armhf \
        cmake \
        git \
        libgstreamer1.0-dev:armhf \
        libgstreamer-plugins-base1.0-dev:armhf \
        liborc-0.4-dev:armhf \
        libv4l-dev:armhf

ENV PKG_CONFIG_LIBDIR /usr/lib/arm-linux-gnueabihf/pkgconfig:
