FROM		debian:buster
MAINTAINER	jealee@student.42seoul.kr


#Install needed library
RUN			apt-get update
RUN			apt-get install -y nginx
RUN			apt-get install -y openssl
RUN			apt-get install -y mariadb-server
RUN 		apt-get install -y php-mysql
RUN 		apt-get install -y openssl
RUN 		apt-get install -y vim
RUN 		apt-get install -y wget
RUN 		apt-get install -y php7.3-fpm

COPY		./srcs/init.sh ./
#Nginx Conf file
COPY		./srcs/default ./tmp
#Wordpress Config File
COPY		./srcs/wp-config.php ./tmp
#phpmyadmin config file
COPY		./srcs/config.inc.php ./tmp

#OPEN Port 80: HTTP 443: HTTP/S
EXPOSE		80 443

#Start with init.sh
CMD			bash init.sh
