FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget
RUN wget https://go.skype.com/skypeforlinux-64.deb && \
    apt install -y ./skypeforlinux-64.deb