FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install wget unzip -y && wget https://decentr.net/Ubuntu_x64_Decentr_1.5.1.zip
RUN unzip Ubuntu_x64_Decentr_1.5.1.zip
RUN apt install -y ./decentr-browser-stable_111.1.5563.33-1_amd64.deb
RUN apt -f install
RUN apt-get -y --purge autoremove   
RUN rm Ubuntu_x64_Decentr_1.5.1.zip && rm decentr-browser-stable_111.1.5563.33-1_amd64.deb
