#!/bin/sh

mkdir -p backup

D=`date +"%y%m%d%H%M"`

if test x$1 == x ;
then
   T=""
else
   T="$1-"
fi

docker run --rm  \
       -v moodle-moodledata:/data \
       -v `pwd`/backup/:/backup \
       ubuntu \
       tar xvf /backup/$T$D-moodledata.tar 
docker run --rm  \
       -v moodle-db:/data \
       -v `pwd`/backup/:/backup \
       ubuntu \
       tar xvf /backup/$T$D-moodledb.tar 
