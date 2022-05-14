#!/bin/bash

service mysql start

mysql -u root -e  CREATE DATABASE IF NOT EXISTS wordpress;
mysql -u root -e DROP DATABASE IF EXISTS test;

mysql -u root -p $ROOT_PWD -e ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWD';
mysql -u root -p $ROOT_PWD -e DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
mysql -u root -p $ROOT_PWD -e DELETE FROM mysql.user WHERE User='';

mysql -u root -p $ROOT_PWD -e CREATE USER '$WP_ADMIN_USR'@'%' IDENTIFIED BY '$WP_ADMIN_PWD';
mysql -u root -p $ROOT_PWD -e GRANT ALL ON wordpress.* TO '$WP_ADMIN_USR'@'%' ;
mysql -u root -p $ROOT_PWD -e FLUSH PRIVILEGES;

mysql -u root -p $ROOT_PWD -e CREATE USER '$WP_ADMIN_USR'@'%' IDENTIFIED BY '$WP_PWD';
mysql -u root -p $ROOT_PWD -e GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USR'@'%';
mysql -u root -p $ROOT_PWD -e FLUSH PRIVILEGES;

bash