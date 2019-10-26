set -e

BASE=`pwd`
SYSTEM_NAME=gloss

function get_subdir {
	REPO=$1
	DIR=$2
	rm -rf $DIR	
	echo getting $REPO/trunk/$DIR
	cp -r $REPO/$DIR $SYSTEM_NAME/$DIR
}

cd $BASE/shared 
tar xvf ../../gloss.tar.gz
git clone https://github.com/wdebeaum/step

cd $BASE/shared/gloss/src
git clone http://github.com/wdebeaum/webparser
rm -rf TextTagger

cd $BASE/shared # in shared

get_subdir step src/TextTagger
get_subdir step src/config/Graphviz
get_subdir step src/config/c++

rm -rf step
