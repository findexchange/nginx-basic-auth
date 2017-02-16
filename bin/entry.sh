#!/bin/bash

# Providing defaults values for missing env variables
[ "$DEFAULT_USER" = "" ]        && export DEFAULT_USER="admin"
[ "$DEFAULT_PASSWORD" = "" ]    && export DEFAULT_PASSWORD="$(openssl rand -base64 12)"

printf "$DEFAULT_USER:$(openssl passwd -crypt "${DEFAULT_PASSWORD}")\n" > /htpasswd

echo "=====[ Nginx Basic Auth ]============================================"
echo "Generated default user"
echo "Login: $DEFAULT_USER"
echo "Password: $DEFAULT_PASSWORD"
echo "=========================================================================="

nginx -g "daemon off;"
