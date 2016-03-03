while true
do
  curl -s -u nova:$1 http://localhost:15672/api/queues/%2F/$2 | python -c 'import json,sys;obj=json.load(sys.stdin); print "%s %s" % (obj["message_stats"]["publish_details"]["rate"], obj["message_stats"]["deliver_get_details"]["rate"])' | sed "s/^/$(date '+%Y-%m-%d %H:%M:%S') /"
  sleep 5
done
