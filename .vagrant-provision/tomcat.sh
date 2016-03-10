#!/usr/bin/env bash

DIR_HOME=$1
DOWNLOADS=${DIR_HOME}/Downloads

#Tomcat 8
TOMCAT_DOWNLOAD=${DOWNLOADS}/tomcat
mkdir -p ${TOMCAT_DOWNLOAD}
wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz -P ${TOMCAT_DOWNLOAD}
tar -zxf ${TOMCAT_DOWNLOAD}/apache-tomcat-8.0.32.tar.gz -C ${TOMCAT_DOWNLOAD}
sudo mv ${TOMCAT_DOWNLOAD}/apache-tomcat-8.0.32 /opt/tomcat
export CATALINA_HOME=/opt/tomcat
. ~/.bashrc
sudo chmod 777 -R $CATALINA_HOME
sudo chmod +x $CATALINA_HOME/bin/startup.sh
sudo chmod +x $CATALINA_HOME/bin/shutdown.sh
sudo chmod +x $CATALINA_HOME/bin/catalina.sh
echo alias tomstart=$CATALINA_HOME/bin/startup.sh >> ${DIR_HOME}/.bashrc
echo alias tomstop=$CATALINA_HOME/bin/shutdown.sh >> ${DIR_HOME}/.bashrc
source ${DIR_HOME}/.bashrc
