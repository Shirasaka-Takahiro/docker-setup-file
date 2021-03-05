#!/bin/bash

s=sudo

$s yum update -y
if [ $? = 0 ];then
  echo "updated successfully!"
else
  echo "update aborted! Something went wrong!"
fi
$s yum install -y yum-utils device-mapper-persistent-data lvm
$s yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
$s yum-config-manager --enable docker-ce-edge
$s yum-config-manager --enable docker-ce-test
$s yum -y install docker-ce
$s systemctl enable docker
$s systemctl start docker
$s curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$s chmod +x /usr/local/bin/docker-compose
$s ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
$s groupadd docker
$s usermod -aG docker $USER
$s groups $USER
$s systemctl restart docker
$s gpasswd -a $USER docker
$s systemctl status docker
docker-compose version
if [ $? = 0 ]; then
  echo "docker and docker-compose are available!"
else
  echo "something went wrong!"
fi
