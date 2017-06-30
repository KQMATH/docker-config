#!/bin/bash

echo "placeholder" > /var/moodledata/placeholder
chgrp -R www-data /var/moodledata /var/www/html
chmod g+rwX /var/moodledata /var/www/html

cd /var/www/html 
/usr/bin/php admin/cli/install_database.php \
              --agree-license --non-interactive \
              --adminpass=M00dle 
