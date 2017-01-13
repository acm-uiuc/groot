#!/bin/bash

mkdir ~/GOGROOT
mkdir ~/GOGROOT/bin && mkdir ~/GOGROOT/lib \
&& mkdir ~/GOGROOT/src
mkdir -p ~/GOGROOT/src/github.com/acm-uiuc

echo 'export GOPATH=~/GOGROOT' >> ~/.profile

echo 'export GOROOT=/usr/local/go' >> ~/.profile

echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.profile

curl -O https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -xvf go1.7.linux-amd64.tar.gz
mv go /usr/local

ln -s groot ~/GOGROOT/src/github.com/acm-uiuc/groot

apt-get install nodejs
apt-get install npm
apt-get install build-essential
apt-get update
apt-get install build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
nvm install 7.2.0
nvm use 7.2.0

apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.3.1
rbenv global 2.3.1

gem install bundler

apt-get install mysql-server
apt-get install libmysqlclient-dev
mysqld --intialize

mysql -u root
mysql> CREATE DATABASE groot_recruiter_service;
mysql> CREATE DATABASE acm_users;
mysql> CREATE DATABASE groot_quotes_service;