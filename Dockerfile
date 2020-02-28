FROM debian:buster

RUN apt-get update
RUN apt-get install -y default-mysql-server nginx php php-fpm php-mysql openssl
RUN apt-get install -y vim 
RUN apt-get -y install wget

COPY ./srcs/start.sh /etc
COPY ./srcs/default /etc
COPY ./srcs/mysql.txt /etc
COPY ./srcs/ssl.txt /etc
COPY ./srcs/wp-config.php /var


EXPOSE 80
EXPOSE 443

ENTRYPOINT ["bash", "/etc/start.sh"]
