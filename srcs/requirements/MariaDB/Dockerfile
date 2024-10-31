FROM debian:bookworm
SHELL ["/bin/bash", "-c"] 
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql

COPY shrp.sh .
RUN chmod +x shrp.sh

# create the directory where the socket will be
RUN install -dm 0777 /var/run/mysqld /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

#execute shell scripts within the current shell environment.
#RUN source /run/secrets/db_password.txt secrets/db_password.txt

EXPOSE 3306

CMD ["./shrp.sh"]

# chmod 777 /var/run/mysqld; \
# { echo '[mysqld]'; \
# echo 'skip-host-cache'; \
# echo 'skip-name-resolve'; \
# echo 'bind-address=0.0.0.0'; \
# } | tee /etc/my.cnf.d/docker.cnf; \
# sed -i "s|skip-networking|skip-networking=0|g" \
# /etc/my.cnf.d/mariadb-server.cnf




# USER mysql
# COPY tools/db.sh .
# ENTRYPOINT ["sh", "db.sh"]
# CMD ["/usr/bin/mysqld", "--skip-log-error"]
