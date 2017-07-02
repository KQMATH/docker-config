#!/bin/bash

echo "placeholder" > /var/moodledata/placeholder

cd /var/www/html 
/usr/bin/php admin/cli/install_database.php \
              --agree-license --non-interactive \
              --adminemail=hasc@ntnu.no \
              --fullname="KQMATH development server on localhost" \
              --shortname="KQMATH-localhost" \
              --summary="Demo server for development on localhost" \
              --adminpass=M00dle 

chgrp -R www-data /var/moodledata /var/www/html
chmod g+rwX /var/moodledata /var/www/html
