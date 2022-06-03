#!/bin/bash

sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.3/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' /etc/php/7.3/fpm/php.ini
sed -i 's/;date.timezone =/date.timezone = \"Africa\/Casablanca\"/g' /etc/php/7.3/fpm/php.ini
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 5000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/wordpress --version=6.0 --allow-root --quiet
wp core config --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mysql --skip-check --allow-root --quiet
wp core install --path=/var/www/wordpress --url=localhost --title=abenani --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=abenani@student.1337.ma --allow-root --quiet

exec "$@"