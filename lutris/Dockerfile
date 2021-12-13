FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:lutris-team/lutris
RUN apt-get update
RUN apt-get -y install lutris && \
    apt-get -y --purge autoremove
