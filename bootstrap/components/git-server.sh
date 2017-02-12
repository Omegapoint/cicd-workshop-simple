#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                    CREATE GIT SERVER
# --------------------------------------------------------------------------------------------------

# Add git user
adduser --disabled-password --gecos "" git

# Temp to to git home directory
pushd /home/git

# Create some configs
sudo -i -u git git config --global user.name "vagrant"
sudo -i -u git git config --global user.email "vagrant@omegapoint.se"
sudo -i -u git mkdir .ssh
sudo -i -u git chmod 700 .ssh
sudo -i -u git touch .ssh/authorized_keys
sudo -i -u git chmod 600 .ssh/authorized_keys

# Add ssh keys as authorized
sudo -i -u git cat /vagrant/keys/id_rsa.pub > .ssh/authorized_keys

# Mirror existing Github repos
sudo -i -u git git clone --mirror https://github.com/Omegapoint/cicd-workshop-backend.git
sudo -i -u git git clone --mirror https://github.com/Omegapoint/cicd-workshop-frontend.git

# Return to wherever we were
popd