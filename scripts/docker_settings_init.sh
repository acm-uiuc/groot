#!/bin/bash

# Change directory to root groot directory
scriptsdir=`dirname $0`
cd "$scriptsdir/.."

##### SETUP CREDITS #####
echo "* Setting up CREDITS"
credits="MYSQL = {
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'dbname': 'groot_credits_service'
}

GROOT_SERVICES_URL = 'http://groot-api-gateway:8000'
GROOT_ACCESS_TOKEN = ''
STRIPE_SECRET_KEY = ''"
echo "$credits" > groot-credits-service/settings.py

##### SETUP GIGS #####
echo "* Setting up GIGS"
credits="MYSQL = {
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'dbname': 'groot_gigs_service'
}

GROOT_SERVICES_URL = 'http://groot-api-gateway:8000'
GROOT_ACCESS_TOKEN = ''"
echo "$credits" > groot-gigs-service/settings.py

##### SETUP MEMES #####
echo "* Setting up MEMES"
memes="MYSQL = {
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'dbname': 'groot_meme_service'
}

GROOT_ACCESS_TOKEN = ''
GROOT_SERVICES_URL = 'http://groot-api-gateway:8000'

IMGUR_CLIENT_ID = ''
IMGUR_CLIENT_SECRET = ''"
echo "$memes" > groot-meme-service/settings.py

##### SETUP NOTIFICATION #####
echo "* Setting up NOTIFICATION"
notification="GROOT_SERVICES_URL = 'http://localhost:8000'
GROOT_ACCESS_TOKEN = ''

TWITTER = {
    'consumer_key': '',
    'consumer_secret': '',
    'access_key': '',
    'access_secret': ''
}

SLACK_API_TOKEN = ''

EMAIL = {
    'host': '',
    'port': '',
    'username': '',
    'password': ''
}
"
echo "$notification" > groot-notification-service/settings.py

##### SETUP VOZ #####
echo "* Setting up VOZ"
voz="GROOT_URL = 'http://groot-api-gateway:8000'
GROOT_ACCESS_TOKEN = ''"
echo "$voz" > groot-voz/settings.py

##### SETUP MERCH #####
echo "* Setting up MERCH"
merch_secrets="groot:
    access_key: ''
    host: 'http://groot-api-gateway:8000'

merch_pi:
    access_key: 'INSERT_TOKEN_HERE'
    ip_address: 'INSERT_IPADDRESS'

database:  
  user: root
  password: root
  hostname: db
  name: groot_merch_service"
echo "$merch_secrets" > groot-merch-service/config/secrets.yaml

##### SETUP QUOTES #####
echo "* Setting up QUOTES"
quotes_secrets="groot:
  access_key: 'GROOT_ACCESS_KEY'
  host: 'http://groot-api-gateway:8000'

database:  
  user: root
  password: root
  hostname: db
  name: groot_quote_service"

echo "$quotes_secrets" > groot-quotes-service/config/secrets.yaml

##### SETUP RECRUITERS #####
echo "* Setting up RECRUITERS"
recruiters_secrets="aws:
    access_key_id: ''
    secret_access_key: ''

groot:
    access_key: 'GROOT_ACCESS_KEY'
    host: 'http://groot-api-gateway:8000'

jwt:
  secret: 'SECRET_JWT_TOKEN'

database:  
  user: root
  password: root
  hostname: db
  name: groot_recruiter_service

test_database:  
  user: root
  password: root
  hostname: db
  name: groot_recruiter_service_test"
  
echo "$recruiters_secrets" > groot-recruiters-service/config/secrets.yaml

##### SETUP USERS #####
echo "* Setting up USERS"
users_secrets="groot:
  access_key: 'GROOT_ACCESS_KEY'
  host: 'http://groot-api-gateway:8000'

database:  
  user: root
  password: root
  hostname: db
  name: groot_user_service"
echo "$users_secrets" > groot-users-service/config/secrets.yaml

##### SETUP DESKTOP #####
echo "* Setting up DESKTOP"
desktop="SESSION_TOKEN=INSERT_TOKEN_HERE
STRIPE_PUBLISHABLE_KEY=CHANGEME
SERVICES_URL=http://groot-api-gateway:8000"
echo "$desktop" > groot-desktop-frontend/.env

##### SETUP EVENTS #####
echo "* Setting up EVENTS"
events="FACEBOOK_ACCESS_TOKEN=INSERT_TOKEN_HERE
FACEBOOK_ACM_PAGE_ID=INSERT_PAGE_ID_HERE"
echo "$events" > groot-events-service/.env

##### SETUP GROOT #####
echo "* Setting up GROOT"
groot_config="package config

import (
    \"github.com/acm-uiuc/arbor/proxy\"
    \"github.com/acm-uiuc/arbor/security\"
)

const AuthPrefix = \"Basic \"
const AuthURL string = \"http://groot-auth-stub-service:8008\"
const AuthToken string = \"\"

//Service hosts
const CreditsURL = \"http://groot-credits-service:8765\"
const EventsURL = \"http://groot-events-service:8002\"
const GigsURL = \"http://groot-gigs-service:8964\"
const GroupsURL = \"http://groot-groups-service:9001\"
const HardwareURL = \"http://groot:4523/api/v1.0\"
const MemesURL = \"http://groot-meme-service:42069\"
const MerchURL = \"http://groot-merch-service:6969\"
const NotificationURL = \"http://groot-notification-service:1122\"
const QuotesURL = \"http://groot-quotes-service:9494\"
const RecruiterURL = \"http://groot-recruiters-service:4567\"
const UsersURL = \"http://groot-users-service:8001\"

//Arbor configurations
func LoadArborConfig() {
    security.AccessLogLocation = \"/var/groot-api-gateway/access.log\"
    security.ClientRegistryLocation = \"/var/groot-api-gateway/clients.db\"
    proxy.AccessControlPolicy = \"*\"
}"
echo "$groot_config" > groot-api-gateway/config/config.go
