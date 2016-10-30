#Groot Deployment 

###Deploying Groot is now really easy
*Note: This is all a lot easier if you have an ssh key (without a password if you want it to be even easier) attached to your github*

1. Install repo - https://android.googlesource.com/tools/repo/

    Mac OS
    ```sh
    brew install repo 
    ```

    Ubuntu 14.04+
    ```sh    
    mkdir ~/bin
    PATH=~/bin:$PATH
    https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    ```
2. Clone this repo
3. Within this repo run the following command to start managing the projects
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
