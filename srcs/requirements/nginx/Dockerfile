FROM debian:buster

RUN apt upgrade && apt update -y
RUN apt install nginx

COPY conf/my_site /tmp/nginx/my_site
COPY tools/nginx_start.sh /tmp/nginx/nginx_start.sh

RUN bash /tmp/nginx/nginx_start.sh

RUN nginx -g 'daemon off;'