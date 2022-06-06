#!/bin/bash

if ! [ -d /var/lib/mysql/${DB_NAME} ] ; then 
usermod -d /var/lib/mysql/ mysql
service mysql start
mysql -u root -e "CREATE DATABASE $DB_NAME" > /dev/null 2>&1
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED WITH mysql_native_password by '$MYSQL_PASSWORD'" > /dev/null 2>&1
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION" > /dev/null 2>&1
mysql -u root -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH BY '$MYSQL_ROOT_PASSWORD'" > /dev/null 2>&1
service mysql stop
fi

exec "$@"