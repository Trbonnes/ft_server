# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trbonnes <trbonnes@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/16 09:15:11 by trbonnes          #+#    #+#              #
#    Updated: 2019/12/17 10:33:42 by trbonnes         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apt-get update
apt-get install -y wget
apt-get install -y nginx
apt-get install -y mariadb-server
apt-get install -y php-fpm
apt-get install -y php-mysql
apt-get install -y zip


unzip /var/www/html/wordpress.zip -d /var/www/html/
unzip /var/www/html/phpMyAdmin.zip -d /var/www/html/
rm /var/www/html/wordpress.zip
rm /var/www/html/phpMyAdmin.zip
mv /var/www/html/phpMyAdmin-4.9.2-all-languages var/www/html/phpMyAdmin  

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

service mysql start
mysql -u root -e "CREATE DATABASE wordpress_db"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'user'@'localhost' IDENTIFIED BY 'lolilol' WITH GRANT OPTION"
mysql -u root -e "FLUSH PRIVILEGES"
mysql wordpress_db < /tmp/wordpress_db.sql