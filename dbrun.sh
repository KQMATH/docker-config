#!/bin/sh

docker run -d --name DB -p 3306:3306 \
       -e MYSQL_DATABASE=moodle \
       -e MYSQL_ROOT_PASSWORD=moodle \
       -e MYSQL_USER=moodle \
       -e MYSQL_PASSWORD=moodle \
       -v moodle-db:/var/lib/mysql \
       mysql
