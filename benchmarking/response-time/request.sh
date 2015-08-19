#/bin/bash
TIME=`date +%Y%m%d%H%M%S.%N`
T1=`date +%s.%N`
METADATA=`curl http://169.254.169.254/2009-04-04/meta-data/instance-id 2> /dev/null`
T2=`date +%s.%N`
SQLTIME=`echo $TIME | cut -c 1-14`
NANOS=`echo $TIME | cut -c 16-`
if [ "$METADATA" == "i-00023199" ]
then
	ERROR=0
else
	ERROR=1
fi
RESPTIME=`bc<<<"$T2-$T1" | sed s/^\\\./0./`
mysql -D metadata -e "insert into results (timestamp, nanos, responce_time, error) values('$SQLTIME', '$NANOS', '$RESPTIME', '$ERROR')"
