#!/bin/bash

#website access configuration
echo "Access Config for files"

chown -R www-data /var/www/*
chmod -R 755 /var/www/*
#ssl private key and certificate generation with privileges
echo "Generating SSL key and Certifications"

openssl req -newkey rsa:4096 -days 365 -nodes -keyout localhost.key -out localhost.crt -subj "/C=KR/ST=Seoul/L=Seocho-gu/O=42Seoul/OU=GON/CN=localhost"
chmod 600 localhost.crt localhost.key
mv localhost.key etc/ssl/private
mv localhost.crt etc/ssl/certs


