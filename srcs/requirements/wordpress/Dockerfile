FROM  alpine:3.15

# Update System and Install Tools
RUN apk update && \
	apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache \
	php7-phar mariadb-client openrc

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN openrc && \
	touch /run/openrc/softlevel

COPY tools /

RUN adduser -S nginx && addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/wordpress
COPY conf/index.html /var/www/html

# RUN ./conf.sh
ENTRYPOINT [ "sh", "/run.sh" ]
