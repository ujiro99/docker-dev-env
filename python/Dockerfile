FROM python:latest

WORKDIR /root

# add-apt-repository
RUN apt-get update
RUN apt-get install apt-file -y && apt-file update
RUN apt-file search add-apt-repository
RUN apt-get install software-properties-common -y

# vim
ADD vim ./vim
RUN apt-get install ncurses-dev liblua5.2-dev -y
RUN ln -s /usr/include/lua5.2 /usr/include/lua
RUN ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/local/lib/liblua.so
RUN if [ ! -d vim ]; then git clone https://github.com/vim/vim.git; fi
WORKDIR vim
RUN ./configure \
        --enable-fail-if-missing \
        --with-features=huge \
        --disable-selinux \
        --enable-cscope \
        --enable-fontset \
        --enable-multibyte \
        --enable-python3interp \
        --enable-luainterp=yes \
        --enable-gui=no \
        --with-python3-config-dir=/usr/lib/python3.5/config
RUN make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
RUN make install
WORKDIR /root
RUN rm -rf vim

# other packages
RUN chmod a+x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
RUN apt-get install tig less zip pv -y

# python packages
WORKDIR /mnt/work
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# ssh
WORKDIR /root
Add .ssh .ssh
Add ssh.sh ssh.sh
RUN ./ssh.sh
RUN rm ssh.sh

# enables japanese
RUN apt-get install locales -y
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

# my settings
RUN git clone git@github.com:ujiro99/dotfiles.git
WORKDIR /root/dotfiles
RUN ./setup.linux.sh

WORKDIR /root
