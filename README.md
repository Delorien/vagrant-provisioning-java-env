#Vagrant Provisioning Java Environment

 The objective of this simple project is allow the creation of a java development environment containing basics features.
 Using [Vagrant Provisioning](https://www.vagrantup.com/docs/provisioning/) over ssh script to make the installations and customizations.

##Will be installed:
 * Java 8
 * Maven 3.3
 * MySql
 * Tomcat
 * Git
 * Eclipse


The installations are customizable. To prevent any installation just comment the script-call row.
Example:
```bash
# Install MySql
#config.vm.provision "shell", path: ".vagrant-provision/my-sql.sh"
```

##For usage:
* Input the email to be used to generate the key in variable:

```bash
#
# VARIABLES
GIT_USER = <input-your-git-email>
```

* Select host OS for eclipse:

```bash
#
# VARIABLES
HOST = "linux"
#HOST = "windows"
```

##Virtual machine details
 * Ubuntu64
 * 4GB RAM
 * Provider: [Virtual Box](https://www.virtualbox.org/)

