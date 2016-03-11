while true
do
  count=$(mongo -u admin -p ${1} admin --eval "db = db.getSiblingDB('${2}'); printjson(db.${3}.stats())" | grep count | grep -o '[[:digit:]]\+')
  echo $(date '+%F %T') $count
  sleep 60
done
