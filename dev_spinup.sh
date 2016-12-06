#!/bin/bash

mkdir -p log/dev

#########################################################################
#																		#
#																		#
#			I N S T A L L   G R O O T   A P I   G A T E W A Y 		    #
#																		#
#																		#
#########################################################################
	
./groot/build.sh 
cp groot/build/groot build/groot

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
#		I N S T A L L   G R O O T   Q U O T E S   S E R V I C E 		#
#																		#
#																		#
#########################################################################

cd groot-quotes-service

bundle install

cd ..

#########################################################################
#																		#
#																		#
#	 					 R U N    G R O O T	   							#
#																		#
#																		#
#########################################################################

trap 'kill %1; kill %2; kill %3; kill %4; kill %5;' SIGINT

node groot-users-service/server.js  | tee log/dev/groot-users-service.log | sed -e 's/^/[groot-users-service] /' \
& node groot-groups-service/server.js  | tee log/dev/groot-groups-service.log | sed -e 's/^/[groot-groups-service] /' \
& npm --prefix ./groot-desktop-frontend start  | tee log/dev/groot-desktop-frontend.log | sed -e 's/^/[groot-desktop-frontend] /' \
& ruby groot-recruiters-service/app.rb | tee log/dev/groot-recruiters-service.log | sed -e 's/^/[groot-recruiters-service] /' \
& ruby groot-quotes-service/app.rb | tee log/dev/groot-quotes-service.log | sed -e 's/^/[groot-quotes-service] /' \
& ./build/groot -u | tee log/dev/groot.log | sed -e 's/^/[groot] /' \
