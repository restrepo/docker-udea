
# Gfif Docker Repository for SARAH

## USAGE
Download image from Docker Hub at https://hub.docker.com/r/gfif/sarah/tags
```bash
$ docker pull gfif/sarah:sarah
#Check downloaded image
$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
gfif/sarah   sarah     bca5612b83ad   22 months ago   1.73GB
```
### To run the image, use
```bash
docker run -p 8000:8000 gfif/sarah:sarah jupyterhub-start
```
In the browser point to http://localhost:8000, and login into the Jupyter server with
* Username: sarah 
* Password: sarah

The Jupyter file browser should display something like

![img](https://raw.githubusercontent.com/restrepo/docker-udea/master/hub.png)

Go to the `BSM-Submodules` directory and open the `index.ipynb` notebook. See the documentation of https://github.com/restrepo/BSM-Submodules for details.

## Stop the container use
List the containers to check for the `CONTAINER ID`
```bash
docker container ls
```
and stop it
```bash
docker stop CONTAINER_ID
```
### Remove the image
List the images to check for the `IMAGE ID`
```bash
docker image ls
```
and remove it
```bash
docker image rm -f IMAGE_ID
```

## Build the image and upload to Docker Hub

### Installing Docker in Debian
See: https://docs.docker.com/engine/install/debian/
```bash
# apt-get update

# apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -        
# add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
# apt update
# apt install docker-ce

#OPTIONAL: install compose: https://docs.docker.com/compose/install/
# curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose
```

If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:
```
sudo usermod -aG docker your-user
```

### Building and Image from Dockerfile
```.sh
docker build --tag=sarah .
```

### To test image create 
```.sh
docker run -it sarah bash
```

### Running Docker Loaded
```.sh
docker run -p 8000:8000 sarah jupyterhub-start
```

### Uploading to Docker Hub

```.sh
docker login

root@host:# docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
sarah                   latest              45c7f5f5654e        6 minutes ago       1.73GB

docker tag 45c7f5f5654e gfif/sarah:sarah

docker push gfif/sarah:sarah
```

### Download and run from Docker Hub
See __[USAGE](https://github.com/restrepo/docker-udea/blob/master/README.md#usage)__ section 
