#!/bin/bash

screen -S gloss -d -m bash -c "/home/vagrant/shared/$SYSTEM_NAME/bin/trips-$SYSTEM_NAME -nolisp -debug true -display None; exec sh;"
sleep 15
screen -S lisp -d -m bash -c "cd /home/vagrant/shared/$SYSTEM_NAME/src/Systems/gloss && sbcl --eval '(progn (load \"test\") (run))'"
