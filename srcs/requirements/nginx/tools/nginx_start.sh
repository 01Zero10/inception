mkdir /var/www/my_site && echo "<?php phpinfo(); ?>" >> /var/www/my_site/index.php

chown -R www-data /var/www/*
chmod -R +755 /var/www/*

cp /var/www/index.nginx-debian.html /var/www/my_site

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/my_site.crt -keyout /etc/nginx/ssl/my_site.key -subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=dbalducc/CN=my_site"

cp /tmp/nginx/my_site /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/my_site /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default