#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                     INSTALL JENKINS
# --------------------------------------------------------------------------------------------------

# Add Jenkins debian repo key
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install jenkins package
apt-get update
apt-get install -y jenkins

# Temp to to git home directory
pushd /var/lib/jenkins

# Create ssh directories
sudo -i -u jenkins mkdir .ssh
sudo -i -u jenkins chmod 700 .ssh
sudo -i -u jenkins touch .ssh/authorized_keys
sudo -i -u jenkins chmod 600 .ssh/authorized_keys

# Copy keys
cp /vagrant/keys/id_rsa /var/lib/jenkins/.ssh/
chown jenkins:jenkins /var/lib/jenkins/.ssh/id_rsa
sudo -i -u jenkins chmod 600 /var/lib/jenkins/.ssh/id_rsa
sudo -i -u jenkins cp /vagrant/keys/id_rsa.pub /var/lib/jenkins/.ssh/

# Create known hosts and include ourselves!
sudo -i -u jenkins touch /var/lib/jenkins/.ssh/known_hosts
sudo -i -u jenkins chmod 644 /var/lib/jenkins/.ssh/known_hosts
sudo -i -u jenkins ssh-keyscan -H 192.168.33.10 >> /var/lib/jenkins/.ssh/known_hosts
sudo -i -u jenkins ssh-keyscan -H localhost >> /var/lib/jenkins/.ssh/known_hosts

# Add credentials for Nexus if installed
sudo -i -u jenkins mkdir .m2
cp /vagrant/bootstrap/components/jenkins/settings.xml .m2/settings.xml
chown jenkins .m2/settings.xml

# Restart jenkins one last time
service jenkins restart

# Return to wherever we were
popd
