FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y curl php php-fpm php-mysql mariadb-client

#RUN wget https://wordpress.org/wordpress-6.0.9.tar.gz -P /var/www \
#    && cd /var/www && tar -xzf wordpress-6.0.9.tar.gz && rm wordpress-6.0.9.tar.gz
RUN install -dm 0755 /var/www/html/wordpress

# COPY conf/wp-config.php /var/www

RUN	chown -R root:root /var/www/html/wordpress

EXPOSE 9000

COPY setup_script.sh .
RUN chmod +x setup_script.sh

CMD ["./setup_script.sh"]
