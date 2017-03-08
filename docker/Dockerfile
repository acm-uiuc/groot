FROM debian:jessie
ENV DEBIAN_FRONTEND=noninteractive
MAINTAINER ACM@UIUC

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y --no-install-recommends apt-utils

############ INSTALL PYTHON ############
RUN apt-get install -y python python-dev python-pip python-virtualenv

############ INSTALL RUBY ############
RUN apt-get install -y ruby ruby-dev
RUN sudo gem install bundler

############ INSTALL GO ############
# Install Go
RUN \
  apt-get install -y curl && \
  mkdir -p /goroot && \
  curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

############ INSTALL NODEJS ############
RUN apt-get install -y nodejs npm
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

############ SETUP GROOT ############
ENV PATH=${PATH}:~/bin
RUN \
  apt-get update && apt-get install -y git-core curl && \
  mkdir ~/bin && \
  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
  chmod a+x ~/bin/repo && \
  mkdir groot && \
  cd groot && \
  repo init -u git@github.com:acm-uiuc/groot-manifest && \
  repo sync

EXPOSE 8000
EXPOSE 5000
