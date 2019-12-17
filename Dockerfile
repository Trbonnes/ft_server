FROM debian:buster
MAINTAINER Bonneson Tristan <trbonnes@student.42.fr>

COPY src/wordpress.zip /var/www/html/
COPY src/phpMyAdmin.zip /var/www/html/
COPY src/localhost.conf /etc/nginx/sites-available/localhost
COPY src/wp-config.php /var/www/html/wordpress/wp-config.php
COPY src/domain.crt /etc/ssl/certs/localhost.crt
COPY src/domain.key /etc/ssl/private/localhost_key.key
COPY src/start.sh .

RUN bash start.sh

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash