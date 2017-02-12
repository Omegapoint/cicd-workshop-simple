#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
#                                      INSTALL NODE
# --------------------------------------------------------------------------------------------------

# Add NodeJS key for Nodesource
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install Node + npm
apt-get install -y nodejs