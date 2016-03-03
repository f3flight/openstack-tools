while true
do
  result="$(ceilometer alarm-list | grep $1 | grep -c insufficient_data )"
  echo -e "$(date)\t$result"
  sleep 40
done
