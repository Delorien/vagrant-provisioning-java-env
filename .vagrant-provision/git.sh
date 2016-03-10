#!/usr/bin/env bash

GIT_USER=$1
DIR_HOME=$2

#Git
sudo apt-get install -y -qq git
ssh-keygen -f ${DIR_HOME}/.ssh/id_rsa -t rsa -N "" -C "$GIT_USER"
