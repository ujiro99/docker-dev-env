FROM alpine:3.7

MAINTAINER ujiro99 <siro.cola@gmail.com>

RUN apk --update add \
    bash bash-completion \
    clang \
    cppcheck \
    ctags \
    gcc g++ musl-dev make \
    git git-bash-completion \
    openssh-client \
    tmux \
    vim \
  && apk add global --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
  && rm -rf /var/lib/apt/lists/*

# ssh
WORKDIR /root
Add .ssh .ssh
Add ssh.sh ssh.sh
RUN ./ssh.sh && rm ssh.sh

# my settings
RUN git clone git@github.com:ujiro99/dotfiles.git
RUN ./dotfiles/setup.linux.sh

