#!/bin/bash

echo "placeholder" > /var/moodledata/placeholder
chgrp -R www-data /var/moodledata /var/www/html
chmod g+rwX /var/moodledata /var/www/html

read pid cmd state ppid pgrp session tty_nr tpgid rest < /proc/self/stat
trap "kill -TERM -$pgrp; exit" EXIT TERM KILL SIGKILL SIGTERM SIGQUIT

source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
