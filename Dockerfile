# Use an official Python runtime as a parent image
FROM ubuntu:16.04

LABEL maintainer="Ben Shapiro <erectcrested@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    libc6                    \
     libreadline6 libreadline6-dev \
     apt-utils \
  libx11-6                 \
  libasound2               \
  libatk1.0-0              \
  libcairo2                \
  libcups2                 \
  libdbus-glib-1-2         \
  libgconf-2-4             \
  libgcrypt20 \
  libgdk-pixbuf2.0-0       \
  libgtk-3-0               \
  libice6                  \
  libncurses5              \
  libsm6                   \
  liborbit2                \
  libudev1                 \
  libusb-0.1-4             \
  libstdc++6               \
  libstdc++6					\
  libxt6						\
  libxt6                   \
  libxtst6                 \
  libgnomeui-0             \
  libusb-1.0-0-dev         \
  libcanberra-gtk-module   \
  gtk2-engines-murrine     \
  libpython2.7				    \
  unzip         				\
  wget

# Set the working directory to /opt/
VOLUME /opt
WORKDIR /opt
RUN wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb && dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb

RUN mkdir /opt/sdk/
ADD OpenWrt-SDK-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2 /opt/sdk/

RUN mkdir /opt/toolchain/
ADD OpenWrt-Toolchain-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2 /opt/toolchain/

RUN mkdir /opt/app
