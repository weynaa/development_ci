#!/bin/bash

service dbus start &> /dev/null

(avahi-daemon --no-drop-root --no-rlimits &> /dev/null) & /entrypoint "$@"  


