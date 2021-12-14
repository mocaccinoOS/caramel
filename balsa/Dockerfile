# === Debian Linux ===
# image is broken
# FROM debian:bookworm

# RUN apt-get update
# RUN apt-get install -y balsa && \
#    apt-get -y --purge autoremove   

# === Arch Linux ===
#
FROM archlinux

RUN pacman -Syy
RUN pacman -S --noconfirm balsa
