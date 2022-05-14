FROM debian:buster

RUN apt upgrade && apt update -y

RUN apt-get install -y php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip \
                 curl

RUN chown www-data: /var/www
RUN curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /tmp/www
RUN chmod -R +755 /var/www/*