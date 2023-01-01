#!/bin/bash

service dbus start

set -m
/entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner & avahi-daemon --no-drop-root --no-rlimits 
fg %1
