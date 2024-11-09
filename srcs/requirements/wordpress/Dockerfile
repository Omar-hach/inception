FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y curl php php-fpm php-mysql mariadb-client

RUN install -dm 0755 /var/www/html/wordpress

RUN	chown -R root:root /var/www/html/wordpress

EXPOSE 9000

COPY tools/setup_script.sh .

RUN chmod +x setup_script.sh

CMD ["./setup_script.sh"]
