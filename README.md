# EAK  *folked from [deviantony/docker-elk](https://github.com/deviantony/docker-elk/)*
![GitHub Logo](/EAK.jpg)

### Setup
```
#install docker and docker-compose
#install nginx
#install htaccess

```
#### nginx settings
```
    server {
        listen 80;
        location / {
            proxy_pass http://127.0.0.1:5601;
            proxy_set_header     X-Forwarded-For $remote_addr;
            proxy_set_header     Host $http_host;
            auth_basic           "Not for everyone";
            auth_basic_user_file /etc/apache2/.htpasswd;
        }

        listen 443 ssl http2;
        listen [::]:443 ssl http2;
		location / {
			proxy_pass http://127.0.0.1:8080;
		}

        ssl_certificate         /etc/ssl/certs/ssl_bundle.crt;
        ssl_certificate_key     /etc/ssl/private/ssl.key;
        ssl_trusted_certificate /etc/ssl/certs/ssl_bundle.crt;

        ssl_protocols         TLSv1.2 TLSv1.3;
		ssl_prefer_server_ciphers on;
		ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
		ssl_ecdh_curve secp384r1;
		ssl_session_cache shared:SSL:5m;
		ssl_session_timeout 24h;
		ssl_session_tickets off;
		ssl_stapling on;
		ssl_stapling_verify on;
		ssl_buffer_size 8k;

		resolver 8.8.8.8 8.8.4.4 valid=300s;
		resolver_timeout 5s;
	}

```