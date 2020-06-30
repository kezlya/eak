# EAK  *folked from [deviantony/docker-elk]*

### Run locally
```
docker-compose up -d
```

### Build Image of ElasticSearch for VM container
```
gcloud builds submit --tag gcr.io/anthive-prod/search
```

mount data:
```
Mount path	                         Host path	Mode
/usr/share/elasticsearch/backups	/home	Read/write
```

Restor from Backup (possibly run as sudo !!)
```
cd /home
mkdir anthive
chmod -R g+rw anthive
curl -XPUT "http://localhost:9200/_snapshot/anthive" -H 'Content-Type: application/json' -d'{  "type": "fs",  "settings": {    "location": "anthive",    "compress": true  }}'

git clone https://github.com/kezlya/anthive-index-backup.git

cp -r anthive-index-backup/* anthive/
curl -XPOST "http://localhost:9200/_snapshot/anthive/snapshot_2020-june/_restore"
```

Back index up to github
```
curl -XPUT "http://localhost:9200/_snapshot/anthive/snapshot_2020-june?wait_for_completion=true" -H 'Content-Type: application/json' -d'{  "indices": "games,stats",  "ignore_unavailable": true,  "include_global_state": false,  "metadata": {    "taken_by": "local-machine",    "taken_because": "backup from old historical games of 2018/9"  }}'
```