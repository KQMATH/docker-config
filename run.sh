#!/bin/sh

docker run -d -P --name moodle --link DB:DB -p 8088:80 \
        -v moodle-moodledata:/var/moodledata \
        -v `pwd`/../moodle/:/var/www/html \
	kqm/moodle

