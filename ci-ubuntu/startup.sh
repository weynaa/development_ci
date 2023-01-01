#!/bin/bash
sudo service dbus start &> /dev/null
sudo service avahi-daemon start &> /dev/null
exec "$@"