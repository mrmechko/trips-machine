set -e

BASE=`pwd`
SYSTEM_NAME=gloss

function get_subdir {
	REPO=$1
	DIR=$2
	rm -rf $SYSTEM_NAME/$DIR	
	cp -r $REPO/$DIR $SYSTEM_NAME/$DIR
}

cd $BASE/shared 
mkdir step
cd step
cvs checkout -P step

cd $BASE
$BASE/acquisition/webparser.sh step
