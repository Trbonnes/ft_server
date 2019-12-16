FROM debian:buster
MAINTAINER Bonneson Tristan <trbonnes@student.42.fr>

COPY src/wordpress.zip /var/www/html/
COPY src/phpMyAdmin.zip /var/www/html/
COPY src/start.sh .

EXPOSE 80

RUN bash start.sh

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash
	#tail -f /dev/null
