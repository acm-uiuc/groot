#!/bin/bash

mkdir -p log/prod

# Groot API
./groot/build.sh 
cp groot/build/groot build/groot

# Groot Users Service
cd groot-users-service
npm install
cd ..

# Groot Groups Service
cd groot-groups-service
npm install
cd ..

# Groot Desktop Frontend
cd groot-desktop-frontend
npm install
npm build
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

# Set Production Env Vars
export NODE_ENV="production"
export RACK_ENV="production"

trap 'kill %1; kill %2; kill %3; kill %4; kill %5; kill %6; kill %7; kill %8' SIGINT

forever -f groot-users-service/server.js  | tee log/prod/groot-users-service.log \
& forever -f groot-groups-service/server.js  | tee log/prod/groot-groups-service.log \
& forever -f groot-desktop-frontend/server.js  | tee log/prod/groot-desktop-frontend.log \
& forever -f groot-events-service/server.js  | tee log/prod/groot-events-service.log \
& forever -f -c ruby groot-recruiters-service/app.rb | tee log/prod/groot-recruiters-service.log \
& forever -f -c ruby groot-quotes-service/app.rb | tee log/prod/groot-quotes-service.log \
& forever -f -c python groot-meme-service/app.py | tee log/prod/groot-meme-service.log \
& forever -f -c python groot-credits-service/app.py | tee log/prod/groot-credits-service.log \
& ./build/groot | tee log/prod/groot.log
