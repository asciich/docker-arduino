FROM ubuntu:18.04

MAINTAINER Reto Hasler <reto.hasler@asciich.ch>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo "Europe/Zurich" > /etc/timezone && \
    apt-get update && \
    apt-get install -y \
        libgtk2.0 \
        libxi6 \
        libxtst6 \
        vim \
        wget \
        x11-apps && \
    wget https://downloads.arduino.cc/arduino-1.8.5-linux64.tar.xz \
        -O /arduino.tar.xz && \
    tar xfv /arduino.tar.xz && \
    ln -s /arduino-1.8.5 /arduino && \
    cd /arduino/ && \
    ./install.sh && \
    ln -s /arduino/arduino /usr/bin/arduino && \
    rm -f /arduino.tar.xz && \
    apt-get clean