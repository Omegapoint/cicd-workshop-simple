#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                    GENERATE SSH KEYS
# --------------------------------------------------------------------------------------------------
#if [ ! -d /vagrant/keys ]; then
#  mkdir -p /vagrant/keys
#  pushd /vagrant/keys
#  ssh-keygen -t rsa -C "git@192.168.33.10" -q -f id_rsa -N ''
#  popd
#fi

/vagrant/bootstrap/components/java.sh
/vagrant/bootstrap/components/common.sh
/vagrant/bootstrap/components/node.sh
/vagrant/bootstrap/components/git-server.sh
/vagrant/bootstrap/components/sonarqube/sonarqube.sh
/vagrant/bootstrap/components/nexus/nexus.sh
/vagrant/bootstrap/components/hosts.sh
/vagrant/bootstrap/components/jenkins/jenkins.sh
