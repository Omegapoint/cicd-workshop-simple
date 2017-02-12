#!/usr/bin/env bash

/vagrant/bootstrap/components/java.sh
/vagrant/bootstrap/components/common.sh
/vagrant/bootstrap/components/node.sh
/vagrant/bootstrap/components/hosts.sh
/vagrant/bootstrap/components/apache.sh

# Add jenkins user
adduser --disabled-password --gecos "" jenkins
chown -R jenkins:jenkins /var/www/html

# Temp to to git home directory
pushd /home/jenkins

# Add jenkins credentials
sudo -i -u jenkins mkdir .ssh
sudo -i -u jenkins chmod 700 .ssh
sudo -i -u jenkins cp /vagrant/keys/authorized_keys .ssh
sudo -i -u jenkins chmod 600 .ssh/authorized_keys

# Return to wherever we were
popd

# Setup application
mkdir /opt/cicd-workshop-backend
chown -R jenkins:jenkins /opt/cicd-workshop-backend
chmod 0775 /opt/cicd-workshop-backend

# Add init script
cp /vagrant/bootstrap/components/backend/cicd-workshop-backend.sh /etc/init.d/cicd-workshop-backend
chmod 755 /etc/init.d/cicd-workshop-backend

# Reload init scripts
update-rc.d cicd-workshop-backend defaults
