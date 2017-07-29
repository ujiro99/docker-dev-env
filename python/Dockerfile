FROM python:latest

WORKDIR /mnt/work

# install vim
ADD vim ./vim
RUN apt update -y && apt install ncurses-dev -y
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
        --with-python3-config-dir=/usr/lib/python3.5/config
RUN make VIMRUNTIMEDIR=/usr/share/vim/vim8
RUN make install

# install python packages
WORKDIR /mnt/work
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

