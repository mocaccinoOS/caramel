FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install wget -y && wget https://decentr.net/Ubuntu_x64_Decentr_1.5.1.zip
RUN unzip Ubuntu_x64_Decentr_1.5.1.zip
RUN dpkg -i decentr-browser-stable_111.1.5563.33-1_amd64.deb && \
    apt-get -y --purge autoremove   
