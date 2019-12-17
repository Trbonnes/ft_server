FROM debian:buster
MAINTAINER Bonneson Tristan <trbonnes@student.42.fr>

COPY srcs/wordpress.zip /var/www/html/
COPY srcs/phpMyAdmin.zip /var/www/html/
COPY srcs/localhost.conf /etc/nginx/sites-available/localhost
COPY srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY srcs/domain.crt /etc/ssl/certs/localhost.crt
COPY srcs/domain.key /etc/ssl/private/localhost_key.key
COPY srcs/start.sh .

RUN bash start.sh

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash