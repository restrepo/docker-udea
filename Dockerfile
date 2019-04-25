
FROM jupyterhub/jupyterhub

MAINTAINER Omar Zapata

ARG JUPYTERHUB_VERSION=0.9.6

USER root

#Installing base packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-setuptools python3-dev build-essential gfortran make gcc feynmf python3-pip git  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


#Installing Python basic packages
RUN pip install --no-cache  pandas numpy matplotlib scipy wheel

#Installing jupyterhub packages
RUN pip install --no-cache  pyslha bash_kernel ipykernel notebook

RUN python -m bash_kernel.install 

#Crating SARAH User to logging in jupyterhub
RUN useradd -rm -p $(openssl passwd -1 sarah) sarah -s /bin/bash -d /home/sarah

#The next code is to execute code as user, su is not allowed
RUN git clone https://github.com/ncopa/su-exec.git
RUN cd su-exec && make && mv su-exec /usr/local/bin/ && chmod u+s /usr/local/bin/su-exec


# Create script to get repo when docker is starting
RUN echo "#!/bin/bash" > /usr/local/bin/get-repo 
RUN echo "cd /home/sarah && su-exec sarah:sarah git clone --recursive https://github.com/restrepo/BSM-Submodules" >> /usr/local/bin/get-repo 
RUN chmod +x /usr/local/bin/get-repo 

#create script to start jupyterhub
RUN echo "#!/bin/bash"  > /usr/local/bin/jupyterhub-start
RUN echo "jupyterhub --generate-config"  >> /usr/local/bin/jupyterhub-start
RUN echo 'echo "from jupyter_client.localinterfaces import public_ips" >>  jupyterhub_config.py ' >> /usr/local/bin/jupyterhub-start
RUN echo 'echo "c.JupyterHub.hub_ip = public_ips()[0]" >> jupyterhub_config.py' >> /usr/local/bin/jupyterhub-start
RUN echo 'get-repo' >> /usr/local/bin/jupyterhub-start
RUN echo "jupyterhub" >> /usr/local/bin/jupyterhub-start
RUN chmod +x /usr/local/bin/jupyterhub-start





#Setting up locale and encoding
ENV LANG=en_US.UTF-8

#USER nobody
CMD ["jupyterhub-start"]
