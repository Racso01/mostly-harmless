#! /bin/bash

/opt/sandstorm/sandstorm start
exec tail -f /opt/sandstorm/var/log/sandstorm.log
