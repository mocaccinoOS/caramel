FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y libreoffice && \
    apt-get -y --purge autoremove   
