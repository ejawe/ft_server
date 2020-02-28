#!/bin/bash

########### telechargement phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz 
mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
mv phpmyadmin /var/www
rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

########### telechargement wordpress
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
mv wordpress /var/www
rm latest.tar.gz
mv var/wp-config.php var/www/wordpress

########### config de nginx
rm -rf /etc/nginx/sites-available/default
mv etc/default etc/nginx/sites-available/.
chown -R www-data:www-data /var/www

########### start mysql
service mysql start
mysql -uroot < /etc/mysql.txt
########### certificat SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < /etc/ssl.txt

########### start
service php7.3-fpm start 
service nginx start
bash
