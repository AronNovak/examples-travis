#!/bin/bash

composer global require drush/drush
export PATH=$PATH:~/.composer/vendor/bin

mysql -e "SET GLOBAL wait_timeout = 36000;"
mysql -e "SET GLOBAL max_allowed_packet = 134209536;"
mysql -e "SHOW VARIABLES LIKE 'max_allowed_packet';"
mysql -e "SHOW VARIABLES LIKE 'wait_timeout';"

mysql -e 'CREATE DATABASE drupal'

drush --yes core-quick-drupal --core=drupal-8.x --profile=normal --no-server --db-url=mysql://root:@127.0.0.1/drupal
