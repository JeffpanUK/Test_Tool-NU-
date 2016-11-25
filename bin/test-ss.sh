#########################################################################
# File Name: test-ss.sh
# Author:Jeff 
# mail: kevinjjp@gmail.com
# Created Time: 2016年11月25日 星期五 14时21分41秒
#########################################################################
#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Error: insufficient parameters!"
	echo "Usage:"
        echo "	$0 ./target-exe"
	exit 1
fi
	
#configuration
TOOLDIR=`pwd`/Tools

#python param
SUFFIX=ori
let WARMSTART=1 #0 for cold, 1 for warm
let WARMTIME=3 #the warm times
let ITERTIME=4
TESTDIR=.
OUTPUTDIR=`pwd`/a.report
PATTERNS="Open Report,Latency"

#bash param
EXES=./$1
INSTALLDIR=".."
VOICE=li-li
INPUTTEXT=a.txt
OUTPUTPCM=a.pcm
LOGNAME=a.LOG
VERSION=embedded-high


echo "start testing..."
bash ${TOOLDIR}/shtools/test-time.sh $EXES $INSTALLDIR $VOICE $VERSION $INPUTTEXT $OUTPUTPCM $LOGNAME $SUFFIX $WARMTIME $ITERTIME

echo "generating report"
python ${TOOLDIR}/pytools/read-log.py $TESTDIR $SUFFIX $PATTERNS $OUTPUTDIR

echo "finished!"
