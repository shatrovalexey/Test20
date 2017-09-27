#!/bin/sh

DBADMIN='root'
DBDCL='install.sql'
DBDDL='database.sql'
PROJECT_URL='https://github.com/shatrovalexey/Test20'
APACHE_USER='www-data'
APACHE_GROUP='www-data'

git clone "${PROJECT_URL}"
composer install
cat "${DBDCL}" "${DBDDL}" | mysql -u"${DBADMIN}" -p
chown "${APACHE_USER}":"${APACHE_GROUP}" -R *