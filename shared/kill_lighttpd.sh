#!/bin/bash

screen -S server -X quit
screen -S $SYSTEM_NAME -X quit
screen -S lisp -X quit
