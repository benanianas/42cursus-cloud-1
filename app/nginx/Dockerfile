FROM debian:buster

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update && apt-get install -y nginx \
    openssl
RUN openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/ssl/private/abenani.key" -out "/etc/ssl/certs/abenani.crt" -subj "/C=MA/" 2>/dev/null
COPY ["./wordpress.conf", "/etc/nginx/sites-available/wordpress.conf"]
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled
RUN rm /etc/nginx/sites-enabled/default
RUN rm /var/www/html/*
CMD [ "nginx", "-g", "daemon off;" ]