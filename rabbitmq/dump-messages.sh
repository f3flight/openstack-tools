curl -s -u nova:$1 -d "{'count':$3,'requeue':true,'encoding':'auto'}" http://localhost:15672/api/queues/%2F/$2/get
