#!/bin/bash

composer global require drush/drush
export PATH=$PATH:~/.config/composer/vendor/bin

# MySQL gone away error mitigation.
mysql -e "SET GLOBAL wait_timeout = 36000;"
mysql -e "SET GLOBAL max_allowed_packet = 134209536;"
mysql -e "SHOW VARIABLES LIKE 'max_allowed_packet';"
mysql -e "SHOW VARIABLES LIKE 'wait_timeout';"

# Database for Drupal.
mysql -e 'CREATE DATABASE drupal'

# Vanilla Drupal 8 core.
PHP_OPTIONS="-d sendmail_path=$(which true)"
export PHP_OPTIONS
drush --yes core-quick-drupal --core=drupal-8.3.x --profile=standard --no-server --db-url=mysql://root:@127.0.0.1/drupal testing

# Activates the examples module.
DRUPAL_ROOT=testing/drupal-8.3.x
export DRUPAL_ROOT
ln -s $(pwd) $DRUPAL_ROOT/modules/examples
cd $DRUPAL_ROOT || exit 1
drush --yes pm-enable examples fapi_example

# Create the webserver for WDIO test
drush runserver 127.0.0.1:8080 &
until (curl --output /dev/null --silent --head --fail http://localhost:8080); do sleep 1; done
