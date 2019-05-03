
# Gfif Docker Repository for SARAH

# Installing Docker in Debian/Ubuntu
```.sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
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

# Runnung Docuker Loaded
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
