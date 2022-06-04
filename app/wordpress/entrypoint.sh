#!/bin/bash

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 5000/g' /etc/php/7.3/fpm/pool.d/www.conf

if ! [ -d /var/www/wordpress ] ; then
mkdir -p /var/www/wordpress
wp core download --path=/var/www/wordpress --version=6.0 --allow-root --quiet
wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mysql --skip-check --allow-root --quiet
wp core install --path=/var/www/wordpress --url=localhost --title=abenani --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=abenani@student.1337.ma --allow-root --quiet
fi

exec "$@"