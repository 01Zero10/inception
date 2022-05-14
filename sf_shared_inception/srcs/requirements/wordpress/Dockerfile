FROM debian:buster

RUN apt upgrade && apt update -y

RUN apt-get install -y php \
        tar                 \
        mariadb-client      \
        php-fpm            \
        php-bcmath         \
        php-bz2            \
        php-calendar       \
        php-ctype          \
        php-curl           \
        php-dom            \
        php-exif           \
        php-fileinfo       \
        php-gd             \
        php-gmagick        \
        php-gmp            \
        php-iconv          \
        php-imap           \
        php-intl           \
        php-json           \
        php-mbstring       \
        php-memcache       \
        php-mysqli         \
        php-mysqlnd        \
        php-pdo            \
        php-pgsql          \
        php-phar           \
        php-posix          \
        php-shmop          \
        php-simplexml      \
        php-soap           \
        php-sockets        \
        php-sqlite3        \
        php-sysvsem        \
        php-sysvshm        \
        php-tokenizer      \
        php-xml            \
        php-xmlreader      \
        php-xmlwriter      \
        php-xsl            \
        php-zip            \
        curl                \
        wget

RUN adduser --no-create-home nginx && addgroup nginx
COPY conf/php-fpm.conf /etc/php/php-fpm.conf
COPY conf/www.conf /etc/php/php-fpm.d/www.conf

COPY conf/index.html /tmp/index.html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]