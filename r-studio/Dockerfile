# === Clearlinux === 
# results in > 2Gig image
# FROM clearlinux:latest

# RUN swupd bundle-add -y R-rstudio git

# === Ubuntu ===
# results in a 700 MB image
# FROM ubuntu:focal
# ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update && apt-get install -y wget
# RUN apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
# RUN apt-get install -y r-base libnss3 libxdamage1 libasound2 git
# RUN wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2021.09.1-372-amd64.deb
# RUN wget https://wlog-rsuite.s3.amazonaws.com/cli/debian/rsuitecli_0.37.253-1_all.deb && \
#    apt install -y ./rsuitecli_0.37.253-1_all.deb && rsuite install && apt install -y ./rstudio-2021.09.1-372-amd64.deb

# === Fedora ===
# results in a 694 MB image
FROM fedora:latest

RUN yum install wget git R yum-utils -y
RUN wget https://www.r-studio.com/downloads/RStudio5_x64.rpm
RUN yum localinstall RStudio5_x64.rpm -y
RUN rm -f RStudio5_x64.rpm
