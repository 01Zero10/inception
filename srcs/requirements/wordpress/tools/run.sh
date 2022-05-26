#!/bin/sh

wp core download --allow-root
wp config create --dbname=$DATABASE_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=dbalducc.42.fr/wordpress --title="Inception" --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASS --admin_email="dbalducc@42.fr" --skip-email --allow-root
wp user create $WP_USER "dba@42.fr" --role=author --user_pass=$WP_PASS --allow-root
wp theme install twentytwentytwo --activate --allow-root
wp plugin update --all --allow-root

php-fpm7 -FR