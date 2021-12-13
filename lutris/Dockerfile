FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wine64
RUN apt-get install software-properties-common
RUN add-apt-repository -y ppa:lutris-team/lutris
RUN apt-get update
RUN apt-get install lutris && \
    apt-get -y --purge autoremove   
