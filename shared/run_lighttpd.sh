#!/bin/bash

echo "RUNNING TRIPS"

mkdir -p /home/vagrant/shared/logs; 
rm -rf /home/vagrant/shared/logs-previous
mv /home/vagrant/shared/logs /home/vagrant/shared/logs-previous
mkdir -p /home/vagrant/shared/logs; 

# yeah you need to figure out how to kill this yourself, buddy
screen -S server -d -m bash -c "lighttpd -D -f /home/vagrant/shared/lighttpd.conf; exec sh"
screen -S gloss -d -m bash -c "/home/vagrant/shared/$SYSTEM_NAME/bin/trips-$SYSTEM_NAME -nolisp -debug true -display None; exec sh;"
sleep 15
screen -S lisp -d -m bash -c "cd /home/vagrant/shared/$SYSTEM_NAME/src/Systems/gloss && sbcl --eval '(progn (load \"test\") (run))'"
