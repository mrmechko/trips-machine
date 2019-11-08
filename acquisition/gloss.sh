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
mkdir gloss
cd gloss
cvs checkout -P gloss

cd $BASE
$BASE/acquisition/webparser.sh gloss

cd $BASE/shared # in shared
git clone http://github.com/wdebeaum/step

#get_subdir step src/TextTagger
get_subdir step src/config/Graphviz
get_subdir step src/config/c++

rm -rf step
