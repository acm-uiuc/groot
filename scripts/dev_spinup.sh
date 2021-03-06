#!/bin/bash

# Change directory to root groot directory
scriptsdir=`dirname $0`
cd "$scriptsdir/.."

mkdir -p log/dev

# Groot API
./groot-api-gateway/build.sh 
cp groot-api-gateway/build/groot-api-gateway build/groot-api-gateway

# Groot Users Service
cd groot-users-service
bundle install
cd ..

# Groot Auth Service
cd groot-auth-stub-service
bundle install
cd ..

# Groot Groups Service
cd groot-groups-service
npm install
cd ..

# Groot Desktop Frontend
cd groot-desktop-frontend
npm install
npm run build
cd ..

# Groot Events Service
cd groot-events-service
npm install
cd ..

# Groot Recruiters Service
cd groot-recruiters-service
bundle install
cd ..

# Groot Quotes Service
cd groot-quotes-service
bundle install
cd ..

# Groot Merch Service
cd groot-merch-service
bundle install
cd ..

# Groot Meme Service
cd groot-meme-service
pip install -r requirements.txt --user
cd ..

# Groot Credits Service
cd groot-credits-service
pip install -r requirements.txt --user
cd ..

# Groot Gigs Service
cd groot-gigs-service
pip install -r requirements.txt --user
cd ..

# Groot Voz
cd groot-voz
pip install -r requirements.txt --user
cd ..

trap 'kill %1; kill %2; kill %3; kill %4; kill %5; kill %6; kill %7; kill %8; kill %9; kill %10; kill %11; kill %12; kill %13' SIGINT

ruby groot-users-service/app.rb  | tee log/dev/groot-users-service.log | sed -e 's/^/[groot-users-service] /' \
& ruby groot-auth-stub-service/app.rb  | tee log/dev/groot-auth-stub-service.log | sed -e 's/^/[groot-auth-stub-service] /' \
& node groot-groups-service/server.js  | tee log/dev/groot-groups-service.log | sed -e 's/^/[groot-groups-service] /' \
& node groot-desktop-frontend/server.js | tee log/dev/groot-desktop-frontend.log | sed -e 's/^/[groot-desktop-frontend] /' \
& node groot-events-service/server.js  | tee log/dev/groot-events-service.log | sed -e 's/^/[groot-events-service] /' \
& ruby groot-recruiters-service/app.rb | tee log/dev/groot-recruiters-service.log | sed -e 's/^/[groot-recruiters-service] /' \
& ruby groot-quotes-service/app.rb | tee log/dev/groot-quotes-service.log | sed -e 's/^/[groot-quotes-service] /' \
& ruby groot-merch-service/app.rb | tee log/dev/groot-merch-service.log | sed -e 's/^/[groot-merch-service] /' \
& python groot-meme-service/app.py | tee log/dev/groot-meme-service.log | sed -e 's/^/[groot-meme-service] /' \
& python groot-credits-service/app.py | tee log/dev/groot-credits-service.log | sed -e 's/^/[groot-credits-service] /' \
& python groot-gigs-service/app.py | tee log/dev/groot-gigs-service.log | sed -e 's/^/[groot-gigs-service] /' \
& python groot-voz/app.py | tee log/dev/groot-voz.log | sed -e 's/^/[groot-voz] /' \
& ./build/groot-api-gateway -u | tee log/dev/groot-api-gateway.log | sed -e 's/^/[groot] /'
