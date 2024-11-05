#!bin/sh


sed -i "s/SQL_DATABASE/${SQL_DATABASE}/"   /etc/mysql/init.sql
sed -i "s/SQL_USER/${SQL_USER}/"  /etc/mysql/init.sql
sed -i "s/SQL_PASSWORD/${SQL_PASSWORD}/"  /etc/mysql/init.sql

# # Restart mariadb with new config in the background to keep the container running
mysqld_safe
