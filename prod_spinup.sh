#!/bin/bash

mkdir -p log/prod

# Groot API
./groot-api-gateway/build.sh 
cp groot-api-gateway/build/groot-api-gateway build/groot-api-gateway

# Groot Users Service
cd groot-users-service
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
export MEME_DEBUG=false
cd ..

# Groot Credits Service
cd groot-credits-service
pip install -r requirements.txt --user
export CREDITS_DEBUG=false
cd ..

# Groot Gigs Service
cd groot-gigs-service
pip install -r requirements.txt --user
cd ..

# Groot Voz
cd groot-credits-service
pip install -r requirements.txt --user
export VOZ_DEBUG=false
cd ..

# Set Production Env Vars
export NODE_ENV="production"
export RACK_ENV="production"

trap 'kill %1; kill %2; kill %3; kill %4; kill %5; kill %6; kill %7; kill %8; kill %9; kill %10; kill %11; kill %12' SIGINT

forever -f -c ruby groot-users-service/app.rb  | tee log/prod/groot-users-service.log \
& forever -f groot-groups-service/server.js  | tee log/prod/groot-groups-service.log \
& forever -f groot-desktop-frontend/server.js  | tee log/prod/groot-desktop-frontend.log \
& forever -f groot-events-service/server.js  | tee log/prod/groot-events-service.log \
& forever -f -c ruby groot-recruiters-service/app.rb | tee log/prod/groot-recruiters-service.log \
& forever -f -c ruby groot-quotes-service/app.rb | tee log/prod/groot-quotes-service.log \
& forever -f -c ruby groot-merch-service/app.rb | tee log/prod/groot-merch-service.log \
& forever -f -c python groot-meme-service/app.py | tee log/prod/groot-meme-service.log \
& forever -f -c python groot-credits-service/app.py | tee log/prod/groot-credits-service.log \
& forever -f -c python groot-gigs-service/app.py | tee log/prod/groot-gigs-service.log \
& forever -f -c python groot-voz/app.py | tee log/prod/groot-voz.log \
& ./build/groot-api-gateway | tee log/prod/groot-api-gateway.log
