#!/bin/bash

mkdir ~/GOGROOT
mkdir ~/GOGROOT/bin && mkdir ~/GOGROOT/lib \
&& mkdir ~/GOGROOT/src
mkdir -p ~/GOGROOT/src/github.com/acm-uiuc

echo 'export GOPATH=~/GOGROOT' >> ~/.profile

echo 'export GOROOT=/usr/local/opt/go/libexec' >> ~/.profile

echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.profile

brew install go

ln -s groot ~/GOGROOT/src/github.com/acm-uiuc/groot

brew install node

brew install rbenv

rbenv install 2.3.1
rbenv global 2.3.1

gem install bundler

brew install mysql
mysqladmin -u root password 'yourpassword' 
mysql.server restart

mysql -u root
mysql> CREATE DATABASE groot_recruiter_service;
mysql> CREATE DATABASE acm_users;
mysql> CREATE DATABASE groot_quotes_service;