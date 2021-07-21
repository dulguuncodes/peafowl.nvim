FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S git \
              base-devel --noconfirm

RUN git clone https://aur.archlinux.org/yay.git

RUN cd yay

RUN makepkg -si

RUN makepkg --install

RUN yay --version
