#!/bin/bash

mkdir -p /home/vagrant/shared/logs; 
rm -rf /home/vagrant/shared/logs-previous
mv /home/vagrant/shared/logs /home/vagrant/shared/logs-previous
mkdir -p /home/vagrant/shared/logs; 

# yeah you need to figure out how to kill this yourself, buddy
screen -S server -d -m bash -c "lighttpd -D -f /home/vagrant/shared/lighttpd.conf; exec sh"

if test -f "/home/vagrant/shared/${SYSTEM_NAME}.sh";
then
	/home/vagrant/shared/bin/${SYSTEM_NAME}.sh
else
	/home/vagrant/shared/bin/trips.sh
fi
