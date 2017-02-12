#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                CREATE JENKINS USER
# --------------------------------------------------------------------------------------------------

# Add jenkins user
adduser --disabled-password --gecos "" jenkins

# Temp to to git home directory
pushd /home/jenkins

# Add jenkins credentials
sudo -i -u jenkins mkdir .ssh
sudo -i -u jenkins chmod 700 .ssh
sudo -i -u jenkins cp /vagrant/keys/authorized_keys .ssh
sudo -i -u jenkins chmod 600 .ssh/authorized_keys

# Return to wherever we were
popd