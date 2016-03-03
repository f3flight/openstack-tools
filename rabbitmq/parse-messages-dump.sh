python -c 'import json,sys;obj=json.load(sys.stdin); print "["+", ".join([el["payload"] for el in obj])+"]"' | sed 's/"{/{/g' | sed 's/}"/}/g' | sed 's/\\"/"/g'
