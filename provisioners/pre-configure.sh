#/bin/bash

source ~/SYSTEM_NAME
DEPPATH="$TRIPSDEP/tripsDependencies"
#curl -L http://cpanmin.us | perl - --sudo App::cpanminus
curl -L http://cpanmin.us | perl - --self-upgrade

pip install virtualenv
git clone http://github.com/mrmechko/tripsmodule
cd tripsmodule && pip install .
