#!/bin/sh

docker run --rm  \
       --link DB:DB \
       -v moodle-moodledata:/data \
       -v `pwd`/../moodle/:/var/www/html \
       kqm/moodle \
       /etc/install.sh
