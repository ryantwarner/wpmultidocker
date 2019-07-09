#!/bin/bash

mkdir wp-content
ln -s /var/www/multitenant/app/stable ./wp
ln -s /var/www/multitenant/assets/mu-plugins ./wp-content/mu-plugins
ln -s /var/www/multitenant/assets/plugins ./wp-content/plugins
ln -s /var/www/multitenant/assets/themes ./wp-content/themes
ln -s /var/www/multitenant/config/db-config.php ./db-config.php
ln -s /var/www/multitenant/config/wp-env.php ./wp-env.php
ln -s /var/www/multitenant/drop-ins/advanced-cache.php ./wp-content/advanced-cache.php
ln -s /var/www/multitenant/drop-ins/db.php ./wp-content/db.php
ln -s /var/www/multitenant/drop-ins/db-error.php ./wp-content/db-error.php
ln -s /var/www/multitenant/drop-ins/object-cache.php ./wp-content/object-cache.php
