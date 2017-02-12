#!/usr/bin/env bash

/vagrant/bootstrap/components/java.sh
/vagrant/bootstrap/components/common.sh
/vagrant/bootstrap/components/node.sh
/vagrant/bootstrap/components/hosts.sh
/vagrant/bootstrap/components/apache.sh
/vagrant/bootstrap/components/jenkins-user.sh

# Create folder to keep backend jar
mkdir /opt/cicd-workshop-backend

# Let jenkins own the folder (to allow overwrite)
chown -R jenkins:jenkins /opt/cicd-workshop-backend
chmod 0775 /opt/cicd-workshop-backend

# Add init script
cp /vagrant/bootstrap/components/backend/cicd-workshop-backend.sh /etc/init.d/cicd-workshop-backend
chmod 755 /etc/init.d/cicd-workshop-backend

# Reload init scripts
update-rc.d cicd-workshop-backend defaults

# Make jenkins the owner of html
chown -R jenkins:jenkins /var/www/html
