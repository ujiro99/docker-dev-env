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

# install python packages
WORKDIR /mnt/work
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

