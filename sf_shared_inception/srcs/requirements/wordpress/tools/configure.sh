#!/bin/bash

while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD wordpress &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    mv /tmp/index.html /var/www/html/index.html

    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=localhost/wordpress --title=Inception --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme install inspiro --activate --allow-root
    wp plugin update --all --allow-root

fi

/usr/sbin/php-fpm7 -F -R