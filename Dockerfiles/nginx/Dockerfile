FROM debian:buster

ARG HOST

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update && apt-get install -y nginx \
    openssl
RUN openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/ssl/private/abenani.key" -out "/etc/ssl/certs/abenani.crt" -subj "/C=MA/" 2>/dev/null
RUN rm /etc/nginx/sites-enabled/default
RUN rm -rf /var/www/html
COPY ["./websites.conf", "/etc/nginx/sites-available/websites.conf"]
RUN sed -i 's/::host::/'"$HOST"'/g' /etc/nginx/sites-available/websites.conf
RUN ln -s /etc/nginx/sites-available/websites.conf /etc/nginx/sites-enabled

CMD [ "nginx", "-g", "daemon off;" ]