# AntHive.IO ELK

### Setup
```
mkdir elasticsearch/data
chmod 777 elasticsearch/data
chmod 777 elasticsearch/backups
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
  "include_global_state": false,
  "index_settings": {
    "index.number_of_replicas": 0
  },
  "ignore_index_settings": [
    "index.refresh_interval"
  ]
}
```

### Reindex
```
POST _reindex
{
  "source": {
    "index": "games"
  },
  "dest": {
    "index": "games_new"
  }
}
```

### Unlock Index
```
PUT games/_settings
{
  "index": {
    "blocks": {
      "read_only_allow_delete": "false"
    }
  }
}
```
