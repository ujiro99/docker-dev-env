FROM debian:jessie-slim

MAINTAINER ujiro99 <siro.cola@gmail.com>

RUN apt-get update
RUN apt-get install \
    clang \
    cppcheck \
    ctags \
    gcc g++ musl-dev make \
    git bash-completion \
    less \
    locales \
    ncurses-dev liblua5.2-dev \
    python3-dev \
    silversearcher-ag \
    tig \
    tmux \
    wget -y

# vim
RUN wget --no-check-certificate https://github.com/vim/vim/archive/master.tar.gz \
  && ln -s /usr/include/lua5.2 /usr/include/lua \
  && ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/local/lib/liblua.so \
  && tar xvf master.tar.gz \
  && cd vim-master \
  && ./configure \
        --enable-fail-if-missing \
        --with-features=huge \
        --disable-selinux \
        --enable-cscope \
        --enable-fontset \
        --enable-multibyte \
        --enable-python3interp \
        --enable-luainterp=yes \
        --enable-gui=no \
        --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
  && make VIMRUNTIMEDIR=/usr/local/share/vim/vim80 \
  && make install \
  && cd .. \
  && rm -rf vim-master master.tar.gz

# ssh
WORKDIR /root
Add .ssh .ssh
Add ssh.sh ssh.sh
RUN ./ssh.sh && rm ssh.sh

# my settings
RUN git clone git@github.com:ujiro99/dotfiles.git
RUN ./dotfiles/setup.linux.sh

# enables japanese
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

