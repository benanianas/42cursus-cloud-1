FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath wget
RUN wget -q https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-english.tar.gz -O /tmp/phpmyadmin.tar.gz
RUN mkdir -p /var/www/phpmyadmin
RUN mkdir /var/www/phpmyadmin/tmp && chmod 0777 /var/www/phpmyadmin/tmp
RUN tar -zxf /tmp/phpmyadmin.tar.gz -C /tmp
RUN cp -r /tmp/phpMyAdmin-5.2.0-english/* /var/www/phpmyadmin
RUN cp /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php
RUN sed -i 's/localhost/mysql/g' /var/www/phpmyadmin/config.inc.php
RUN echo >> /var/www/phpmyadmin/config.inc.php
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 6000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "\$cfg['blowfish_secret'] = '$(openssl rand -base64 22)';" >> /var/www/phpmyadmin/config.inc.php
RUN mkdir /run/php/

CMD [ "php-fpm7.3", "--nodaemonize" ]
