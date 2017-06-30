#!/bin/sh

docker run --rm  \
       -v moodle-moodledata:/data \
       moodle \
       /etc/install.sh
