#!/bin/bash

mkdir -p log

#########################################################################
#																		#
#																		#
#			I N S T A L L   G R O O T   A P I   G A T E W A Y 		    #
#																		#
#																		#
#########################################################################
	
go install github.com/gorilla/mux

go install github.com/acm-uiuc/groot/proxy

go install github.com/acm-uiuc/groot/secrets

go install github.com/acm-uiuc/groot/services

mkdir -p build 

go build -o  ./build/groot ./groot/server 

#########################################################################
#																		#
#																		#
#		I N S T A L L    G R O O T   U S E R S   S E R V I C E		    #
#																		#
#																		#
#########################################################################

cd groot-users-service

npm install

cd ..

#########################################################################
#																		#
#																		#
#		I N S T A L L   G R O O T   G R O U P S   S E R V I C E			#
#																		#
#																		#
#########################################################################

cd groot-groups-service

npm install

cd ..

#########################################################################
#																		#
#																		#
#	  I N S T A L L   G R O O T   D E S K T O P   F R O N T E N D	    #
#																		#
#																		#
#########################################################################

cd groot-desktop-frontend

npm install

cd ..


#########################################################################
#																		#
#																		#
#	I N S T A L L   G R O O T   R E C R U I T E R S   S E R V I C E		#
#																		#
#																		#
#########################################################################

cd groot-recruiters-service

bundle install

cd ..

#########################################################################
#																		#
#																		#
#	 					 R U N    G R O O T	   							#
#																		#
#																		#
#########################################################################

trap 'kill %1; kill %2; kill %3; kill %4;' SIGINT

node groot-users-service/server.js  | tee log/groot-users-service_dev.log | sed -e 's/^/[groot-users-service] /' \
& node groot-groups-service/server.js  | tee log/groot-groups-service_dev.log | sed -e 's/^/[groot-groups-service] /' \
& node groot-desktop-frontend/server.js  | tee log/groot-desktop-frontend_dev.log | sed -e 's/^/[groot-desktop-frontend] /' \
& ruby groot-recruiters-service/app.rb | tee log/groot-recruiters-service_dev.log | sed -e 's/^/[groot-recruiters-service] /' \
& ./builds/groot | tee log/groot_dev.log | sed -e 's/^/[groot] /' \
