FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

<<<<<<< HEAD
RUN swupd bundle-add -y lutris
=======
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:lutris-team/lutris
RUN apt-get update
RUN apt-get -y install lutris && \
    apt-get -y --purge autoremove   
>>>>>>> parent of f8a6c1b... lutris: try clearlinux for this run
