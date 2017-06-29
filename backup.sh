#!/bin/sh

mkdir -p backup

D=`date +"%y%m%d%H%M"`

docker run --rm  \
       -v moodle-moodledata:/data \
       -v `pwd`/backup/:/backup \
       ubuntu \
       tar cvf /backup/moodledata$D.tar /data
docker run --rm  \
       -v moodle-db:/data \
       -v `pwd`/backup/:/backup \
       ubuntu \
       tar cvf /backup/moodledb$D.tar /data
