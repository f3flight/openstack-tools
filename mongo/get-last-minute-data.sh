mongo -u admin -p ${1} admin --eval "db = db.getSiblingDB('${2}'); var d = new Date(); db.${3}.find({timestamp:{\$gt : new Date(d - 60000)}}).forEach(printjson)"
