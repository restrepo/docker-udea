
# Gfif Docker Repository for SARAH

# Building and Image from Dockerfile
docker build --tag=sarah .

# To test image create 
docker run -it sarah bash

# Runnung Docuker Loaded
docker run -p 8000:8000 sarah jupyterhub-start

# Running Docker From Hub
docker run -p 8000:8000 -d --name sarah gfif/sarah jupyterhub-start

# Uploading Docker
docker login

root@host:# docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
sarah                   latest              45c7f5f5654e        6 minutes ago       1.73GB

docker tag 45c7f5f5654e gfif/sarah:sarah

docker push gfif/sarah:sarah
