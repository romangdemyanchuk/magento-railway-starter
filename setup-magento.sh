#!/bin/bash

echo "Waiting for MySQL to be ready..."
until mysqladmin ping -h"$MYSQL_HOST" --silent; do
  sleep 2
done

echo "Starting Magento installation..."

php bin/magento setup:install \
  --base-url="http://localhost/" \
  --db-host="$MYSQL_HOST" \
  --db-name="$MYSQL_DATABASE" \
  --db-user="$MYSQL_USER" \
  --db-password="$MYSQL_PASSWORD" \
  --admin-firstname="Roman" \
  --admin-lastname="Admin" \
  --admin-email="admin@example.com" \
  --admin-user="admin" \
  --admin-password="admin123" \
  --language="en_US" \
  --currency="USD" \
  --timezone="Europe/Kyiv" \
  --use-rewrites="1" \
  --backend-frontname="admin"

echo "Magento installed successfully."

# Додаткове налаштування
php bin/magento module:enable --all
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento cache:flush
php bin/magento indexer:reindex

echo "Setup complete."
