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
    go get github.com/acm-uiuc/arbor/proxy && \
    go get github.com/acm-uiuc/arbor/services && \
    go get github.com/acm-uiuc/arbor/security && \
    go get github.com/acm-uiuc/arbor/server && \
    go install github.com/gorilla/mux && \
    go install github.com/boltdb/bolt && \
    go install github.com/kennygrant/sanitize && \
    go install github.com/acm-uiuc/arbor/proxy && \
    go install github.com/acm-uiuc/arbor/services && \
    go install github.com/acm-uiuc/arbor/security && \
    go install github.com/acm-uiuc/arbor/server

# Bundle app source
ADD . /usr/src/app

# Create symlink to GOPATH for groot
RUN mkdir -p $GOPATH/src/github.com/acm-uiuc && \
    ln -sf /usr/src/app $GOPATH/src/github.com/acm-uiuc/groot-api-gateway

# Create folder for client key database
RUN mkdir -p /var/groot-api-gateway/

# Build groot
ADD build.sh /usr/src/app
RUN ./build.sh

CMD ["./build/groot"]