#!/bin/bash

if ! [ -d /var/www/wordpress/index.php ] ; then
wp core download --path=/var/www/wordpress --version=6.0 --allow-root --quiet
wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mysql --skip-check --allow-root --quiet
wp core install --path=/var/www/wordpress --url=$HOST --title=abenani --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=abenani@student.1337.ma --allow-root --quiet
fi

exec "$@"