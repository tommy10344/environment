FROM tomiyosi/base-dev
MAINTAINER Hiroaki Tomiyoshi<fomr1002@gmail.com>

RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update -y

RUN apt-get install -y dotnet-dev-1.0.0-preview2.1-003177

# Node
npm install -g yo generator-aspnet bower
