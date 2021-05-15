FROM		debian:buster
MAINTAINER	jealee@student.42seoul.kr

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
COPY		./srcs/default ./tmp
COPY		./srcs/wp-config.php ./tmp
COPY		./srcs/config.inc.php ./tmp
EXPOSE		80 443
CMD			bash init.sh
