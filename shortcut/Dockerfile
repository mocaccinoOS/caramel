FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:haraldhv/shotcut
RUN apt-get install -y shotcut  && \
    apt-get -y purge openssl software-properties-common
