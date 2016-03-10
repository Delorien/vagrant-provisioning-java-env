#!/usr/bin/env bash

HOST=$1
DIR_HOME=$2
DOWNLOADS=${DIR_HOME}/Downloads

#Ecipse
ECLIPSE_DOWNLOAD=${DOWNLOADS}/eclipse
mkdir -p ${ECLIPSE_DOWNLOAD}

## INSTALL FOR WINDOWS ##
if [ ${HOST} = "windows" ]; then
	ECLIPSE_URL=http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-win32-x86_64.zip
	sudo wget ${ECLIPSE_URL} -O ${ECLIPSE_DOWNLOAD}/eclipse.zip
	sudo unzip ${ECLIPSE_DOWNLOAD}/eclipse.zip -d /vagrant
else
## INSTALL FOR LINUX ##
ECLIPSE_URL=http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
sudo wget ${ECLIPSE_URL} -O ${ECLIPSE_DOWNLOAD}/eclipse.tar.gz
sudo tar -zxf ${ECLIPSE_DOWNLOAD}/eclipse.tar.gz -C /vagrant
fi

## CREATE WORKSPACE ##
mkdir -p /vagrant/workspace
