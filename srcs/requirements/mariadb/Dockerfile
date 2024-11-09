FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sql /etc/mysql/init.sql

COPY tools/setup_script.sh .

RUN chmod +x setup_script.sh

RUN install -dm 0755 /var/run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["./setup_script.sh"]
