#!/bin/bash

mkdir -p log/prod

#########################################################################
#																		#
#																		#
#			I N S T A L L   G R O O T   A P I   G A T E W A Y 		    #
#																		#
#																		#
#########################################################################
	
echo Building mux	
go install github.com/gorilla/mux

echo Building boltdb
go install github.com/boltdb/bolt

echo Building Arbor	
go install github.com/acm-uiuc/arbor/proxy
go install github.com/acm-uiuc/arbor/security
go install github.com/acm-uiuc/arbor/services
go install github.com/acm-uiuc/arbor/server



echo Building config
go install github.com/acm-uiuc/groot-api-gateway/config

echo Building services
go install github.com/acm-uiuc/groot-api-gateway/services

echo Building groot-api-gateway
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p build 
echo Placing binary in [PATH TO GROOT]/build
(cd $DIR; go build -o  $DIR/build/groot-api-gateway .) 
