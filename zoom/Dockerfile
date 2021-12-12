FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget
RUN wget https://cdn.zoom.us/prod/5.8.6.739/zoom_amd64.deb && \
    apt install -y ./zoom_amd64.deb