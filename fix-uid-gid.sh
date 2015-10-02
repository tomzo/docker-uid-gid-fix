#!/bin/bash

set -e

# These are usually known at the time when building the image
DIRECTORY=$1
OWNER_USERNAME=$2
OWNER_GROUPNAME=$3

UID=$(ls --numeric-uid-gid -d $DIRECTORY | awk '{ print $3 }')
GID=$(ls --numeric-uid-gid -d $DIRECTORY | awk '{ print $4 }')

usermod -u $UID $OWNER_USERNAME
groupmod -g $GID $OWNER_GROUPNAME
# Might be needed if the image has files which should be owned by this user and group
# When we know more about user and group then this find might be at smaller scope
# find / -user $OWNER_USERNAME -exec chown -h $UID {} \;
# find / -group $OWNER_GROUPNAME -exec chgrp -h $GID {} \;
usermod -g $GID $OWNER_USERNAME
