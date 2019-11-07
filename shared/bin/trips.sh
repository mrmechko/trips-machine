#!/bin/bash

screen -S $SYSTEM_NAME -L -d -m bash -c "/home/vagrant/shared/$SYSTEM_NAME/bin/trips-$SYSTEM_NAME -logdir /home/vagrant/shared/logs -debug true -display None; exec sh;"
sleep 15
