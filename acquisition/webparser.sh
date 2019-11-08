set -e

BASE=`pwd`

cd $BASE/shared/$1
cvs checkout src/WebParser

