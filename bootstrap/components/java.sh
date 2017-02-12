#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                INSTALL ORACLE JAVA 8 JDK
# --------------------------------------------------------------------------------------------------

# Make sure apt is up to date
apt-get -y -q update

# Install repository tools
apt-get -y -q install software-properties-common htop

# Add custom repository for Java installers
add-apt-repository ppa:webupd8team/java
apt-get -y -q update

# Quietly accept user agreement license
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# Install silently and select Oracle JDK as standard
apt-get -y -q install oracle-java8-installer
update-java-alternatives -s java-8-oracle
