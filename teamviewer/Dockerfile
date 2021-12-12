FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget
RUN wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && \
    apt install -y ./teamviewer_amd64.deb