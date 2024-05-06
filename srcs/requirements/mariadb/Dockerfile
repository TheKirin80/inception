FROM debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y  mariadb-client mariadb-server

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init-db.sql /scripts/init-db.sql

RUN chmod -R 755 /scripts
RUN service mariadb start && \
    mysql < /scripts/init-db.sql

ENTRYPOINT ["mariadbd"]