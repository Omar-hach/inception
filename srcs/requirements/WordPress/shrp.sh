#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

mkdir -p /run/php/

./wp-cli.phar core download --allow-root
./wp-cli.phar config create \
    --dbname=${SQL_DATABASE} \
    --dbuser=${SQL_USER} \
    --dbpass=${SQL_PASSWORD} \
    --dbhost=mariadb:3306 \
    --allow-root
./wp-cli.phar core install --url=${DOMAIN_NAME} \
    --title=${WORDPRESS_TITLE} \
    --admin_user=${WORDPRESS_ADMIN} \
    --admin_password=${WORDPRESS_ADMIN_PASS} \
    --admin_email=${WORDPRESS_ADMIN_EMAIL} \
    --allow-root
./wp-cli.phar user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} \
    --user_pass=${WORDPRESS_USER_PASS} \
    --role=editor \
    --path=/var/www/html/wordpress --allow-root

sed -i '36 s@/run/php/php8.2-fpm.sock@9000@' /etc/php/8.2/fpm/pool.d/www.conf
php-fpm8.2 -F