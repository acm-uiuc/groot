FROM golang:1.7-alpine
MAINTAINER ACM@UIUC

# Get git
RUN apk add --update git bash

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Download and install external dependencies
RUN go get github.com/gorilla/mux && \
    go get github.com/boltdb/bolt && \
    go get github.com/kennygrant/sanitize && \
    go install github.com/gorilla/mux && \
    go install github.com/boltdb/bolt && \
    go install github.com/kennygrant/sanitize

# Bundle app source
ADD . /usr/src/app

# Create symlink to GOPATH for groot
RUN mkdir -p $GOPATH/src/github.com/acm-uiuc && \
    ln -sf /usr/src/app $GOPATH/src/github.com/acm-uiuc/groot

# Create folder for client key database
RUN mkdir -p /var/groot/clients_db

# Build groot
ADD build.sh /usr/src/app
RUN ./build.sh

CMD ["./build/groot"]