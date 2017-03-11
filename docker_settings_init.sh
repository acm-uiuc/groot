#!/bin/bash

##### SETUP CREDITS #####
echo "* Setting up CREDITS"
credits="MYSQL = {
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'dbname': 'groot_credits_service'
}

GROOT_SERVICES_URL = 'http://localhost:8000'
GROOT_ACCESS_TOKEN = ''
STRIPE_SECRET_KEY = ''"
echo "$credits" > groot-credits-service/settings.py

##### SETUP MEMES #####
echo "* Setting up MEMES"
memes="MYSQL = {
    'user': 'root',
    'password': 'root',
    'host': 'db',
    'dbname': 'groot_meme_service'
}

GROOT_ACCESS_TOKEN = ''
GROOT_SERVICES_URL = 'http://localhost:8000'"
echo "$memes" > groot-meme-service/settings.py

##### SETUP MERCH #####
echo "* Setting up MERCH"
merch_secrets="groot:
    access_key: ''"
merch_database="development:    
  user: root
  password: root
  hostname: db
  name: groot_caffeine_service_dev"
echo "$merch_secrets" > groot-merch-service/config/secrets.yaml
echo "$merch_database" > groot-merch-service/config/database.yaml

##### SETUP QUOTES #####
echo "* Setting up QUOTES"
quotes_secrets="groot:
    access_key: ''"
quotes_database="development:    
  user: root
  password: root
  hostname: db
  name: groot_quote_service_dev"
echo "$merch_secrets" > groot-quotes-service/config/secrets.yaml
echo "$merch_database" > groot-quotes-service/config/database.yaml

##### SETUP RECRUITERS #####
echo "* Setting up RECRUITERS"
recruiters_secrets="groot:
    access_key: ''"
recruiters_database="development:    
  user: root
  password: root
  hostname: db
  name: groot_recruiter_service_dev"
echo "$merch_secrets" > groot-recruiters-service/config/secrets.yaml
echo "$merch_database" > groot-recruiters-service/config/database.yaml

##### SETUP USERS #####
echo "* Setting up USERS"
users_secrets="groot:
    access_key: ''"
users_database="development:    
  user: root
  password: root
  hostname: db
  name: groot_user_service_dev"
echo "$merch_secrets" > groot-users-service/config/secrets.yaml
echo "$merch_database" > groot-users-service/config/database.yaml
