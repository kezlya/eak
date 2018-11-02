# AntHive.IO ELK

### Setup
```
mkdir elasticsearch/data
chmod 777 elasticsearch/data
```

### Check Health
```
GET _cluster/health
GET _cat/shards?v
```

### Create index
```
PUT games
{
    "settings" : {
        "number_of_shards" : 3,
        "number_of_replicas" : 0
    }
}
```

### Snapshot backups
```
#snapshot
PUT /_snapshot/v2.2
{
"type": "fs",
"settings": {
"location": "/usr/share/elasticsearch/backups",
"compress": true
}
}

PUT /_snapshot/v2.2/XXXX

GET /_snapshot/v2.2/latest/_status

POST /_snapshot/v2.2/latest/_restore
{
  "indices": "games",
  "ignore_unavailable": true,
  "include_global_state": false
}
```
