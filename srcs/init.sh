#!/bin/bash

openssl req -newkey rsa:4096 -days 365 -nodes -keyout localhost.dev.key -out localhost.dev.crt -subj "/C=KR/ST=Seoul/L=Seocho-gu/O=42Seoul/OU=GON/CN=localhost"

mv localhost.dev.key etc/ssl/private
mv localhost.dev.crt etc/ssl/certs
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

