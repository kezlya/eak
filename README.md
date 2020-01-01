# AntHive.IO EK  folked from https://github.com/deviantony/docker-elk/

### Setup
```

```
#### nginx reverse proxy
```
	server {
		listen		443 ssl;

		location / {
			proxy_pass http://127.0.0.1:9200;
		}

		ssl_certificate       /etc/nginx/certs/search.anthive.io.crt;
        	ssl_certificate_key   /etc/nginx/certs/search.anthive.io.key;
        	ssl_protocols         SSLv3 TLSv1 TLSv1.1 TLSv1.2;
        	ssl_ciphers           HIGH:!aNULL:!MD5;
        	ssl_session_cache     shared:SSL:20m;
#        	ssl_session_timeout   4h;
#        	ssl_handshake_timeout 30s;
	}
```

### Check Health
```
GET _cluster/health
GET _cat/shards?v
```

### Create index
```
PUT games-dev
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0
    }
}

PUT commits-dev
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0
    }
}

PUT bots-dev
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0
    }
}

PUT hours-dev
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0
    }
}
```