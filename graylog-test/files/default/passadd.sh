#!/bin/sh

password=$(pwgen -N 1 -s 96)
sed -i "s/password_secret =/password_secret = ${password}/g" /etc/graylog/server/server.conf
sed -i "s/application.secret=/application.secret = \"${password}\"/g" /etc/graylog/web/web.conf
