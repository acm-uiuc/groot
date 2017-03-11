# GROOT DOCKERFILE

FROM ubuntu
MAINTAINER ACM@UIUC

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils

############ INSTALL PYTHON ############
RUN apt-get install -y python2.7 python2.7-dev python-pip

############ INSTALL RUBY ############
RUN apt-get install -y ruby ruby-dev ruby-bundler libmysqlclient-dev libsqlite3-dev

############ INSTALL NODEJS ############
RUN apt-get install -y curl npm && \
    npm install n less -g && \
    n latest

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

############ SETUP SSH ############

# RUN mkdir -p /root/.ssh
# ADD id_rsa /root/.ssh/id_rsa
# RUN chmod 700 /root/.ssh/id_rsa
# RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

############ SETUP GROOT ############

# Get Go Dependencies
RUN \
  apt-get install -y git-core && \
  go get github.com/gorilla/mux && \
  go get github.com/boltdb/bolt && \
  go get github.com/kennygrant/sanitize && \
  go install github.com/gorilla/mux && \
  go install github.com/boltdb/bolt && \
  go install github.com/kennygrant/sanitize

# Install Python dependencies
COPY groot-credits-service/requirements.txt credits-requirements.txt
COPY groot-meme-service/requirements.txt meme-requirements.txt
RUN pip install -r credits-requirements.txt && \
    pip install -r meme-requirements.txt && \
    rm credits-requirements.txt meme-requirements.txt

# Install Ruby dependencies
COPY groot-merch-service/Gemfile Gemfile
RUN bundle install && rm Gemfile
COPY groot-quotes-service/Gemfile Gemfile
RUN bundle install && rm Gemfile
COPY groot-recruiters-service/Gemfile Gemfile
RUN bundle install && rm Gemfile

# # Install repo
# RUN \
#   apt-get install -y curl && \
#   mkdir ~/bin && \
#   # Install repo
#   curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && \
#   chmod a+x /bin/repo

# ADD . /groot-deploy

# # Install Groot
# RUN \
#   cd /groot-deploy && \
# #   repo init -u git@github.com:acm-uiuc/groot-manifest && \
# #   repo sync && \
#   mkdir -p $GOPATH/src/github.com/acm-uiuc && \
#   ln -s `pwd`/groot $GOPATH/src/github.com/acm-uiuc/groot
# #   cp groot/config/config.go.template groot/config/config.go && \
# #   go install github.com/acm-uiuc/groot/proxy && \
# #   go install github.com/acm-uiuc/groot/config && \
# #   go install github.com/acm-uiuc/groot/services && \
# #   go install github.com/acm-uiuc/groot/security && \
# # cd ..

WORKDIR /groot-deploy

EXPOSE 8000
EXPOSE 5000
