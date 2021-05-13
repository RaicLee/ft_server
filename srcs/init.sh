#!/bin/bash

#ssl private key and certificate generation with privileges
echo "Generating SSL key and Certifications"

#x509 cert since "Error Occurs"
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -keyout jealee_localhost.key -out jealee_localhost.crt -subj "/C=KR/ST=Seoul/L=Seocho-gu/O=42Seoul/OU=GON/CN=localhost"
mv jealee_localhost.key etc/ssl/private
mv jealee_localhost.crt etc/ssl/certs

#Wordpress
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
rm -rf latest.tar.gz

#Wordpress Database
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'jealee'@'localhost' IDENTIFIED BY 'jealee';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'jealee'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password

#start php7.3-fpm 
service php7.3-fpm start


#phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz

#DB for phpMyAdmin
service mysql start
mysql < var/www/html/phpmyadmin/sql/create_tables.sql

