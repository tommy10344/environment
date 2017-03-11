FROM ubuntu:16.04
MAINTAINER Hiroaki Tomiyoshi<fomr1002@gmail.com>

ARG http_proxy
ARG https_proxy
ENV http_proxy ${http_proxy}
ENV https_proxy ${https_proxy}

RUN apt-get update -y

# RUN apt-get install -y openssh-server
RUN apt-get install -y \
        less \
        bash \
        bash-completion \
        zsh \
        python \
        python-pip \
        python3 \
        python3-pip \
        ruby \
        lua5.2 \
        nodejs \
        npm \
        git \
        subversion \
        wget \
        silversearcher-ag \
        ctags \
        tree \
        # gibo \
        ;

# Python
RUN pip install --upgrade pip
# RUN pip3 install --upgrade pip3

# NeoVim
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update -y
RUN apt-get install -y \
        neovim \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip  \
        ;
RUN pip install neovim
RUN pip3 install neovim

ADD dotfiles.sh ${HOME}/dotfiles.sh

# oss-src
RUN mkdir ${HOME}/src \
        && cd ${HOME}/src \
        && git clone https://github.com/github/gitignore

CMD /usr/bin/zsh
