# First Time Setup
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

    # macOS 
    export GOROOT=/usr/local/opt/go/libexec
    # Ubuntu 14.04+
    export GOROOT=/usr/local/go

    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:$GOROOT/bin
    ```
    ```sh
    # macOS
    brew install go
    # Ubuntu 14.04+
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

    go install github.com/gorilla/mux

    go install github.com/boltdb/bolt

    go install github.com/kennygrant/sanitize
    ```

    + Install packages

    ```sh
    go install github.com/acm-uiuc/groot/proxy

    go install github.com/acm-uiuc/groot/config

    go install github.com/acm-uiuc/groot/services

    go install github.com/acm-uiuc/groot/security
    ```
- Node
    + Install Software
    ```sh
    # macOS
    brew install node
    # Ubuntu 14.04+  
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
    ```
- Ruby
    + Install Software
    ```sh
    # macOS
    brew install rbenv
    # Ubuntu 14.04+
    sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    rbenv install 2.3.1
    rbenv global 2.3.1
    # You may have to restart your terminal session
    gem install bundler
    ```
- Python 
    + Install Software
    ```
    # macOS 
    brew install python 
    # Ubuntu
    sudo apt install python-pip
    ```
    
- MySQL
    + Install Software
    ```sh
    # macOS
    brew install mysql
    mysqladmin -u root password 'root' 
    mysql.server restart
    # Ubuntu 14.04+
    sudo apt-get install mysql-server
    sudo apt-get install libmysqlclient-dev
    sudo mysqld --intialize
    ```
  
# Post Installation

Now, you need to follow the individual setup instructions for each service. See the READMEs for each service to get an idea of the process. Usually, it entails copying over a templated-configuration file, installing service dependencies, and creating the database in MySQL.