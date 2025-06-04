#!/bin/bash

if [ ! -f /var/www/html/app/etc/env.php ]; then
  echo "Installing Magento..."
  php bin/magento setup:install \
    --base-url=http://localhost/ \
    --db-host=$MYSQLHOST \
    --db-name=$MYSQL_DATABASE \
    --db-user=$MYSQLUSER \
    --db-password=$MYSQLPASSWORD \
    --admin-firstname=Admin \
    --admin-lastname=User \
    --admin-email=admin@example.com \
    --admin-user=admin \
    --admin-password=Admin123 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Chicago \
    --use-rewrites=1
else
  echo "Magento already installed"
fi

php-fpm
