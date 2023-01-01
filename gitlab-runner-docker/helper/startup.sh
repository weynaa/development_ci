#!/bin/bash

service dbus start

echo "running" "$@"
avahi-daemon --no-drop-root --no-rlimits & /entrypoint "$@"  


