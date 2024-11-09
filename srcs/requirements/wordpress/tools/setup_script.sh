#!/bin/bash

sleep 10 

cd /var/www/html/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv ./wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php/

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    wp core download --allow-root --path=/var/www/html/wordpress/
    wp config create \
      --dbname=${SQL_DATABASE} \
      --dbuser=${SQL_USER} \
      --dbpass=${SQL_PASSWORD} \
      --dbhost=mariadb:3306 \
      --path=/var/www/html/wordpress \
      --allow-root
    wp core install --url=${DOMAIN_NAME} \
        --title=${WORDPRESS_TITLE} \
        --admin_user=${WORDPRESS_ADMIN} \
        --admin_password=${WORDPRESS_ADMIN_PASS} \
        --admin_email=${WORDPRESS_ADMIN_EMAIL} \
        --path=/var/www/html/wordpress \
        --allow-root
    wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} \
        --user_pass=${WORDPRESS_USER_PASS} \
        --role=editor \
        --path=/var/www/html/wordpress --allow-root
fi

sed -i 's/^listen = .*/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf

php-fpm8.2 -F
