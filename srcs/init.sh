#!/bin/bash

#ssl private key and certificate generation with privileges
echo "Generating SSL key and Certifications"

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -keyout jealee_localhost.key -out jealee_localhost.crt -subj "/C=KR/ST=Seoul/L=Seocho-gu/O=42Seoul/OU=GON/CN=localhost"
mv jealee_localhost.key etc/ssl/private
mv jealee_localhost.crt etc/ssl/certs


