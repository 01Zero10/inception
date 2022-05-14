FROM debian:buster

RUN apt upgrade && apt update -y
RUN apt -qq install mariadb-server mariadb-client -y

COPY conf/mariadb.sh /tmp/mariadb.sh

RUN bash /tmp/mariadb.sh

CMD mysqld
