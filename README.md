
# Gfif Docker Repository for SARAH

# Installing Docker in Debian
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

# Building and Image from Dockerfile
```.sh
docker build --tag=sarah .
```

# To test image create 
```.sh
docker run -it sarah bash
```

# Running Docker Loaded
```.sh
docker run -p 8000:8000 sarah jupyterhub-start
```

# Running Docker From Hub
```.sh
docker run -p 8000:8000 -d --name sarah gfif/sarah jupyterhub-start
```

# Uploading Docker

```.sh
docker login

root@host:# docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
sarah                   latest              45c7f5f5654e        6 minutes ago       1.73GB

docker tag 45c7f5f5654e gfif/sarah:sarah

docker push gfif/sarah:sarah
```
