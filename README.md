# Groot Deployment 

### Deploying Groot is now really easy

Groot core development:

[![Join the chat at https://gitter.im/acm-uiuc/groot-development](https://badges.gitter.im/acm-uiuc/groot-development.svg)](https://gitter.im/acm-uiuc/groot-development?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Questions on how to add your app to Groot or use the Groot API:

[![Join the chat at https://gitter.im/acm-uiuc/groot-users](https://badges.gitter.im/acm-uiuc/groot-users.svg)](https://gitter.im/acm-uiuc/groot-users?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


## Getting Started
*Note: It is necessary for you to have an ssh key (without a password if you want it to be even easier) attached to your github*

1. Install repo - https://android.googlesource.com/tools/repo/

    Mac OS
    ```sh
    brew install repo 
    ```

    Ubuntu 14.04+
    ```sh    
    sudo apt install repo

    ```
2. Make a directory to house your groot work
    ```sh
    mkdir groot
    ```
    
3. Within this directory run the following command to start managing the projects

    ```sh    
    repo init -u git@github.com:acm-uiuc/groot-manifest
    ```
    
4. Run the following command to grab the latest releases of the services and frontend

    ```sh    
    repo sync
    ```

    - If you want to grab the latest ever just run the same command 
5. Run the ```dev_spinup.sh``` script to start up a dev instance of groot (will grab the latest version of each service on github)
6. Run the ```prod_spinup.sh``` script to start a production version of groot (will grab the latest version of each and place them in their respective containers, so you will need docker)

#First Time Setup
- Golang 
    + Install Software 
    ```sh
    mkdir [SOME DIRECTORY]
    mkdir [SOME DIRECTORY]/bin && mkdir [SOME DIRECTORY]/lib \
    && mkdir [SOME DIRECTORY]/src
    mkdir -p [SOME DIRECTORY]/src/github.com/acm-uiuc
    ```
    --- Add to .profile (.zshrc/.bashrc) ---
    ```sh
    export GOPATH=[SOME DIRECTORY]

    #macOS 
    export GOROOT=/usr/local/opt/go/libexec
    #Ubuntu 14.04+
    export GOROOT=/usr/local/go

    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:$GOROOT/bin
    ```
    ```sh
    #macOS
    brew install go
    #Ubuntu 14.04+
    sudo curl -O https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
    sudo tar -xvf go1.7.linux-amd64.tar.gz
    sudo mv go /usr/local
    ```
    + Add ```groot``` to ```GOPATH```
    ```sh 
    ln -s [PATH to groot-deploy]/groot [SOME DIRECTORY]/src/github.com/acm-uiuc/groot
    ``` 
    + Install groot dependecies
    ```sh
    go get github.com/gorilla/mux

    go get github.com/boltdb/bolt

    go get github.com/kennygrant/sanitize

    go get github.com/acm-uiuc/arbor/server

    go get github.com/acm-uiuc/arbor/services

    go get github.com/acm-uiuc/arbor/security

    go get github.com/acm-uiuc/arbor/proxy

    go install github.com/gorilla/mux

    go install github.com/boltdb/bolt

    go install github.com/kennygrant/sanitize

    go install github.com/acm-uiuc/arbor/server

    go install github.com/acm-uiuc/arbor/services

    go install github.com/acm-uiuc/arbor/security

    go install github.com/acm-uiuc/arbor/proxy
    ```

    + Install packages

    ```sh
    go install github.com/acm-uiuc/groot/config

    go install github.com/acm-uiuc/groot/services
    ```
- Node
    + Install Software
    ```sh
    #macOS
    brew install node
    #Ubuntu 14.04+  
    sudo apt-get install nodejs
    sudo apt-get install npm
    sudo apt-get install build-essential
    sudo apt-get update
    sudo apt-get install build-essential libssl-dev
    curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
    bash install_nvm.sh
    source ~/.profile
    nvm install 7.2.0
    nvm use 7.2.0
    sudo npm install -g forever
    ```
- Ruby
    + Install Software
    ```sh
    #macOS
    brew install rbenv
    #Ubuntu 14.04+
    sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc (~/.profile / ~/.zshrc)
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc (~/.profile / ~/.zshrc)
    source ~/.bashrc (~/.profile / ~/.zshrc)
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    rbenv install 2.3.1
    rbenv global 2.3.1
    # You may have to restart your terminal session
    gem install bundler
    ```
- Python 
    + Install Software
    ```
    #macOS 
    brew install python 
    #Ubuntu
    sudo apt install python-pip
    ```
    
- MySQL
    + Install Software
    ```sh
    #macOS
    brew install mysql
    mysqladmin -u root password 'yourpassword' 
    mysql.server restart
    #Ubuntu 14.04+
    sudo apt-get install mysql-server
    sudo apt-get install libmysqlclient-dev
    sudo mysqld --intialize
    
    mysql -u root
    mysql> CREATE DATABASE groot_recruiter_service;
    mysql> CREATE DATABASE acm_users;
    mysql> CREATE DATABASE groot_meme_service;
    mysql> CREATE DATABASE groot_quotes_service;
    ```

## Deploying with Docker

1. Follow [these](https://docs.docker.com/compose/install/#uninstallation) instructions to install Docker and docker-compose.
2. Install repo - https://android.googlesource.com/tools/repo/

    Mac OS
    ```sh
    brew install repo 
    ```

    Ubuntu 14.04+
    ```sh    
    sudo apt install repo

    ```
3. Make a directory to house your groot work
    ```sh
    mkdir groot-deploy
    ```
    
4. Within this directory run the following command to start managing the projects

    ```sh    
    repo init -u git@github.com:acm-uiuc/groot-manifest
    ```
    
5. Run the following command to grab the latest releases of all services, including the frontend

    ```sh    
    repo sync
    ```

6. Run the settings init script:
    ```sh
    ./docker_settings_init.sh
    ```
7. Start up Docker. (This may involve `docker-machine` if you're on a Mac)
8. Start the Docker containers:
    ```sh
    docker-compose up
    ```
9. Wait for the image to build and startup. If it works, you'll be able to visit `https://0.0.0.0:5000` in a browser and see the deployed site. The Groot API will be available on port 8000.

## License

This project is licensed under the University of Illinois/NCSA Open Source License. For a full copy of this license take a look at the LICENSE file. 

When contributing new files to this project, preappend the following header to the file as a comment: 

```
Copyright © 2017, ACM@UIUC

This file is part of the Groot Project.  
 
The Groot Project is open source software, released under the University of Illinois/NCSA Open Source License. 
You should have received a copy of this license in a file with the distribution.
```
