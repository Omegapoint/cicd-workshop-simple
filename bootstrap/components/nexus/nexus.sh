#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                        NEXUS
# --------------------------------------------------------------------------------------------------

# Move somewhere temp
pushd /tmp

# Download latest nexus
wget -q -O nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz

# Untar to etc
tar xzf nexus-latest-bundle.tar.gz -C /etc

# Symbolic link
ln -s `ls -1d /etc/nexus-*` /etc/nexus

# Add init script
cp /vagrant/bootstrap/components/nexus/nexus /etc/init.d/nexus
chown root /etc/init.d/nexus
chmod 755 /etc/init.d/nexus

# Reload init scripts
update-rc.d nexus defaults

# Start nexus
service nexus start

# Cleanup
rm -f nexus-latest-bundle.tar.gz

popd