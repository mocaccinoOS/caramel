FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN add-apt-repository ppa:oguzhaninan/stacer
RUN apt-get install -y stacer && \
    apt-get -y --purge autoremove   
