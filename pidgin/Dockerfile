FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y pidgin pidgin-audacious pidgin-awayonlock && \
    apt-get -y --purge autoremove