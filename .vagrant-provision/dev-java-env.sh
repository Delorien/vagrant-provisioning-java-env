#!/usr/bin/env bash

GIT_USER=$1
DIR_HOME=$2
DOWNLOADS=${DIR_HOME}/Downloads

#Tools
sudo apt-get install -y -qq unzip
sudo apt-get install -y -qq xclip

#Java 8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y -qq update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y -qq oracle-java8-installer
sudo apt-get install -y -qq oracle-java8-set-default

#Maven
sudo apt-get purge -y maven
MAVEN_DOWNLOAD=${DOWNLOADS}/maven
mkdir -p ${MAVEN_DOWNLOAD}
wget http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -P ${MAVEN_DOWNLOAD}
tar -zxf ${MAVEN_DOWNLOAD}/apache-maven-3.3.9-bin.tar.gz -C ${MAVEN_DOWNLOAD}
sudo cp -R ${MAVEN_DOWNLOAD}/apache-maven-3.3.9 /usr/local
sudo ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn
echo "export M2_HOME=/usr/local/apache-maven-3.3.9" >> ~/.profile
source ~/.profile

#MySql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y -qq install mysql-server

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

#Git
sudo apt-get install -y -qq git
ssh-keygen -f ${DIR_HOME}/.ssh/id_rsa -t rsa -N "" -C "$GIT_USER"
