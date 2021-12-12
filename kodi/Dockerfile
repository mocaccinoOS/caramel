FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:team-xbmc/ppa
RUN apt-get install -y kodi  && \
    apt-get -y purge openssl software-properties-common
RUN apt-get install -y va-driver-all pulseaudio tzdata locales ca-certificates && \
    apt-get -y --purge autoremove   
