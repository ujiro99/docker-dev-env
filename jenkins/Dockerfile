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
  && rm -rf /var/lib/apt/lists/*

USER jenkins

