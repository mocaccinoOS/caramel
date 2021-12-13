FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget
RUN wget https://downloads.slack-edge.com/releases/linux/4.22.0/prod/x64/slack-desktop-4.22.0-amd64.deb && \
    apt install -y ./slack-desktop-4.22.0-amd64.deb
