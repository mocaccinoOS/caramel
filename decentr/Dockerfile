FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install gdbi-core wget unzip -y && wget https://decentr.net/Ubuntu_x64_Decentr_1.5.1.zip
RUN unzip Ubuntu_x64_Decentr_1.5.1.zip
RUN gdbi decentr-browser-stable_111.1.5563.33-1_amd64.deb && \
    apt-get -y --purge autoremove   
