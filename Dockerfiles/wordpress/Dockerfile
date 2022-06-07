FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-cgi php-common php-fpm php-pear php-mbstring \
    php-zip php-net-socket php-gd php-xml-util \
    php-gettext php-mysql php-bcmath unzip wget
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 5000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /tmp/wp-cli.phar
RUN chmod +x /tmp/wp-cli.phar
RUN mv /tmp/wp-cli.phar /usr/local/bin/wp
COPY ["entrypoint.sh", "/"]
RUN chmod +x /entrypoint.sh
RUN mkdir /run/php/
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "php-fpm7.3", "--nodaemonize" ]