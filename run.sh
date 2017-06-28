#!/bin/sh
docker run -d -P --name moodle --link DB:DB -e MOODLE_URL=http://localhost:8088 -p 8088:80 moodle

