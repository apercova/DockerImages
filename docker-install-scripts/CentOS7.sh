#!/bin/bash

# Uninstall old versions
sudo yum -y remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine
				
# Install dependencies
sudo yum -y install yum-utils \
device-mapper-persistent-data \
lvm2

# Add repo
sudo yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo

# Enables/disables docker-ce-edge repo
#sudo yum-config-manager [--enable/--disable] docker-ce-edge

# Enables/disables docker-ce-test repo
#sudo yum-config-manager [--enable/--disable] docker-ce-test

#Install Docker CE
sudo yum -y install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version
