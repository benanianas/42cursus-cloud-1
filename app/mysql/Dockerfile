FROM ubuntu:focal

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
COPY ["./entrypoint.sh", "/"]
RUN chmod +x /entrypoint.sh
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
RUN echo "default_authentication_plugin= mysql_native_password" >> /etc/mysql/mysql.conf.d/mysqld.cnf
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["mysqld_safe"]