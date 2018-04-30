FROM jenkins/jenkins:2.99-alpine

MAINTAINER ujiro99 <siro.cola@gmail.com>

USER root
RUN apk --update add \
    gcc g++ musl-dev make \
    clang \
    doxygen \
    graphviz \
    cppcheck \
    gcovr \
    vim \
    tmux \
    ctags \
    global --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
  && rm -rf /var/lib/apt/lists/*

USER jenkins

# my settings
RUN cd ~ \
    && git clone https://github.com/ujiro99/dotfiles.git \
    && cd ~/dotfiles \
    && ./setup.linux.sh

