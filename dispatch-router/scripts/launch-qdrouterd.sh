#!/bin/bash

# Set up a sasldb that works on the current host.
echo 'password' | saslpasswd2 -c -p -f /var/lib/qdrouterd/qdrouterd.sasldb user

# Start up the mission
/usr/sbin/qdrouterd
