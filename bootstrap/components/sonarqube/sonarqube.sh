#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                        SONARQUBE
# --------------------------------------------------------------------------------------------------
# TODO [dh] Parameter for sonarcube version
# TODO [dh] Parameter for port

# Change dir temp
pushd /tmp

# Download Sonarqube
wget -q -O /tmp/sonarqube.zip https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.2.zip

# Unzip to /etc
unzip /tmp/sonarqube.zip -d /etc

# Symbolic link
ln -s /etc/sonarqube-6.2 /etc/sonarqube

# Add a binary symbol link
ln -s /etc/sonarqube/bin/linux-x86-64/sonar.sh /usr/bin/sonar

# Specify custom port
printf "\nsonar.web.port=8083\n" | sudo tee -a  /etc/sonarqube/conf/sonar.properties

# Add init script
cp /vagrant/bootstrap/components/sonarqube/sonar /etc/init.d/
chmod 755 /etc/init.d/sonar

# Reload init scripts
update-rc.d sonar defaults

# Start sonar
service sonar start

# Cleanup
rm /tmp/sonarqube.zip

# Return to wherever we were
popd
