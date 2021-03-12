FROM	debian:buster
MAINTAINER	jealee	jealee@student.42seoul.kr

RUN	apt-get update
RUN	apt-get	upgrade
RUN	apt-get	-y install nginx
RUN	apt-get -y install openssl



EXPOSE	80
EXPOSE	443
