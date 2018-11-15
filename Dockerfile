FROM ubuntu:18.04

MAINTAINER Lexin Gong <gonglexin@gmail.com>

ENV REFRESHED_AT=2018-11-15 \
    LANG=en_US.UTF-8 \
    HOME=/opt/build \
    TERM=xterm \
    ERLANG_VERSION=21.1 \
    ELIXIR_VERSION=1.7.4

WORKDIR /opt/build

COPY docker/aliyun.sources.list /etc/apt/sources.list

RUN \
  apt-get clean &&\
  apt-get update -y && \
  apt-get install -y git wget vim locales gnupg libwxbase3.0-dev libwxgtk3.0-dev libsctp1 && \
  locale-gen en_US.UTF-8 && \
  wget https://mirrors.tuna.tsinghua.edu.cn/erlang-solutions/ubuntu/pool/esl-erlang_21.1-1~ubuntu~bionic_amd64.deb && \
  wget https://mirrors.tuna.tsinghua.edu.cn/erlang-solutions/ubuntu/pool/elixir_1.7.3-1~ubuntu~bionic_amd64.deb && \
  dpkg -i esl-erlang_21.1-1~ubuntu~bionic_amd64.deb && \
  apt-get -f -y install && \
  dpkg -i esl-erlang_21.1-1~ubuntu~bionic_amd64.deb && \  
  rm esl-erlang_21.1-1~ubuntu~bionic_amd64.deb && \
  dpkg -i elixir_1.7.4-1~ubuntu~bionic_amd64.deb && \
  rm elixir_1.7.3-1~ubuntu~bionic_amd64.deb && \

CMD ["/bin/bash"]
