FROM gcc:5.5

MAINTAINER ujiro99 <siro.cola@gmail.com>

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  clang-format-3.5 \
  doxygen \
  graphviz \
  cppcheck \
  gcovr \
  && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/clang-format-3.5 /usr/bin/clang-format

