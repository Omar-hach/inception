#!/bin/bash
sleep 10 
# if [ ! -f /var/www/wp-config.php ]; then
#     sed -i "s/SQL_DATABASE/${SQL_DATABASE}/"  /var/www/wp-config.php
#     sed -i "s/SQL_USER/${SQL_USER}/" /var/www/wp-config.php
#     sed -i "s/SQL_PASSWORD/${SQL_PASSWORD}/" /var/www/wp-config.php
#     mv /var/www/wp-config.php /var/www/html/wordpress 
# fi

cd /var/www/html/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv ./wp-cli.phar /usr/local/bin/wp


mkdir -p /run/php/
if [ ! -f /var/www/html/wordpress/index.php ]; then
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
sed -i '36 s@/run/php/php8.2-fpm.sock@9000@' /etc/php/8.2/fpm/pool.d/www.conf

php-fpm8.2 -F