#!/bin/bash

wppath=${1:-"/var/www/wordpress"}

mkdir wp-content
ln -s $wppath/app/stable ./wp
ln -s $wppath/assets/mu-plugins ./wp-content/mu-plugins
ln -s $wppath/assets/plugins ./wp-content/plugins
ln -s $wppath/assets/themes ./wp-content/themes
ln -s $wppath/config/db-config.php ./db-config.php
ln -s $wppath/config/wp-env.php ./wp-env.php
ln -s $wppath/drop-ins/advanced-cache.php ./wp-content/advanced-cache.php
ln -s $wppath/drop-ins/db.php ./wp-content/db.php
ln -s $wppath/drop-ins/db-error.php ./wp-content/db-error.php
ln -s $wppath/drop-ins/object-cache.php ./wp-content/object-cache.php
