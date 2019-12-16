FROM debian:buster
MAINTAINER Bonneson Tristan <trbonnes@student.42.fr>

#COPY src/nginx.conf /ect/ngninx/nginx.conf
COPY src/default.conf /etc/nginx/sites-available/
COPY src/wordpress.zip /var/www/html/
COPY src/start.sh .
EXPOSE 80
RUN bash start.sh
CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	tail -f /dev/null
