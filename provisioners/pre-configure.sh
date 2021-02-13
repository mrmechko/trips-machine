#/bin/bash

source ~/SYSTEM_NAME
DEPPATH="$TRIPSDEP/tripsDependencies"
#curl -L http://cpanmin.us | perl - --sudo App::cpanminus
curl -L http://cpanmin.us | perl - --self-upgrade

pip install virtualenv
git clone http://github.com/mrmechko/tripsmodule
cd tripsmodule && pip install .

i=0
tput sc
while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 ; do
    case $(($i % 4)) in
        0 ) j="-" ;;
        1 ) j="\\" ;;
        2 ) j="|" ;;
        3 ) j="/" ;;
    esac
    tput rc
    echo -en "\r[$j] Waiting for other software managers to finish..." 
    sleep 0.5
    ((i=i+1))
done 

sudo apt-get install -y libicu-dev

cp ~/shared/.sbclrc ~/.sbclrc
cd ~ && git clone https://github.com/joaotavora/sly

