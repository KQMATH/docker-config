#!/bin/sh

docker run --rm  \
       --link DB:DB \
       -v moodle-moodledata:/var/moodledata \
       -v `pwd`/../moodle/:/var/www/html \
       kqm/moodle \
       /etc/install.sh
