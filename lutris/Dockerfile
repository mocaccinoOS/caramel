FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wine64
RUN add-apt-repository -y ppa:lutris-team/lutris
RUN apt-get update
RUN apt-get install lutris && \
    apt-get -y --purge autoremove   
