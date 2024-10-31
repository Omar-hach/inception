FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y curl php7.3 php-fpm php-mysql mariadb-client

#RUN wget https://wordpress.org/wordpress-6.0.9.tar.gz -P /var/www \
#    && cd /var/www && tar -xzf wordpress-6.0.9.tar.gz && rm wordpress-6.0.9.tar.gz

RUN install -dm 0777 /var/www/html/wordpress

#RUN	chown -R root:root /var/www/wordpress

EXPOSE 9000

COPY shrp.sh .
RUN chmod +x shrp.sh

CMD ["./shrp.sh"]
