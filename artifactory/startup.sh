#!/bin/bash

if [ ! "$(ls -A ${ARTIFACTORY_HOME})" ] ; then
    set -e
    echo "First startup detected. Copying default configuration files."
    find "${ARTIFACTORY_HOME}/etc.defaults" -type f -exec cp {} "${ARTIFACTORY_HOME}/etc" \;
fi

set -m
"${ARTIFACTORY_HOME}/app/bin/artifactory.sh" & avahi-daemon --no-drop-root --no-rlimits 
fg %1
