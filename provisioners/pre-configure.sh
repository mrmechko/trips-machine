#/bin/bash

source ~/SYSTEM_NAME
DEPPATH="$TRIPSDEP/tripsDependencies"

pip install virtualenv
git clone http://github.com/mrmechko/tripsmodule
cd tripsmodule && pip install .
