#Groot Deployment 

Groot core development:

[![Join the chat at https://gitter.im/acm-uiuc/groot-development](https://badges.gitter.im/acm-uiuc/groot-development.svg)](https://gitter.im/acm-uiuc/groot-development?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Questions on how to add your app to Groot or use the Groot API:

[![Join the chat at https://gitter.im/acm-uiuc/groot-users](https://badges.gitter.im/acm-uiuc/groot-users.svg)](https://gitter.im/acm-uiuc/groot-users?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

##Getting Started
*Note: It is necessary for you to have an ssh key (without a password if you want it to be even easier) attached to your github*

Prerequisites:
- Have an [ssh key attached to your GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).

1. Install repo - https://android.googlesource.com/tools/repo/

    Mac OS
    ```sh
    brew install repo 
    ```

    Ubuntu 14.04+
    ```sh    
    sudo apt install repo

    ```    
2. Within this directory run the following command to start managing the projects

    ```sh    
    cd groot-deploy
    repo init -u git@github.com:acm-uiuc/groot-manifest
    ```
    
3. Run the following command to grab the latest releases of all repositories

    ```sh    
    repo sync
    ```

    - If you want to update changes with the latest code just run it again.

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
    
5. Run the following command to grab the latest releases of the services and frontend

    ```sh    
    repo sync
    ```

6. Run the settings init script:
    ```sh
    ./docker_settings_init.sh
    ```
7. Start up Docker. (This may involve `docker-machine` if you're on a Mac, or if you've installed the GUI client, just open up the Docker Mac application)

8. Start the Docker containers:
    ```sh
    docker-compose up
    ```
9. Wait for the image to build and startup. If it works, you'll be able to visit `https://0.0.0.0:5000` in a browser and see the deployed site. The Groot API will be available on port 8000.

# Running the Server Without Docker

You can also choose to run groot without Docker, but this requires that all dependencies are already setup correctly. See [the first time setup instructions](first_time_setup.md) for more details. Thus, this is not recommended for local development.

- Run the ```dev_spinup.sh``` script to start up a dev instance of groot (will grab the latest version of each service on github)
- Run the ```prod_spinup.sh``` script to start a production version of Groot (will set appropriate environment variables and expect the API keys to be set correctly)

## License

This project is licensed under the University of Illinois/NCSA Open Source License. For a full copy of this license take a look at the LICENSE file. 

When contributing new files to this project, preappend the following header to the file as a comment: 

```
Copyright © 2017, ACM@UIUC

This file is part of the Groot Project.  
 
The Groot Project is open source software, released under the University of Illinois/NCSA Open Source License. 
You should have received a copy of this license in a file with the distribution.
```
