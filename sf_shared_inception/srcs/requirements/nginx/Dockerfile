FROM debian:buster

RUN apt -qq update && apt -qq upgrade -y && apt install nginx openssl -y

COPY conf/my_site /tmp/nginx/my_site
COPY tools/nginx_start.sh /tmp/nginx/nginx_start.sh

RUN bash /tmp/nginx/nginx_start.sh

#COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
