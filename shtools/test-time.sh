#########################################################################
# File Name: test-time.sh
# Author:Jeff 
# mail: kevinjjp@gamil.com
# Created Time: 2016年11月25日 星期五 10时23分13秒
#########################################################################
#!/bin/bash

EXES=$1
INSTALLDIR=$2
VOICE=$3
VERSION=$4
INPUT=$5
OUTPUT=$6
LOGNAME=$7
SUFFIX=$8
WARMTIME=$9
ITERTIME=${10}



for((i=0; i<${WARMTIME};i++))
do
	./$EXES -I $INSTALLDIR -v $VOICE -O $VERSION -T 2 -i $INPUT -o $OUTPUT > $LOGNAME
done

for((i=0;i<${ITERTIME};i++))
do
	./$EXES -I $INSTALLDIR -v $VOICE -O $VERSION -T 2 -i $INPUT -o $OUTPUT > $LOGNAME
	mv vo* $i.$SUFFIX
done
