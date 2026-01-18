#!/bin/bash
set -e

composer install --no-interaction

source .env

if [[ -z "${APP_KEY}" ]]; then
  php artisan key:generate
  APP_KEY_GENERATED=true
fi

php artisan migrate --force

# Run commands only the first time
if [[ -n "${APP_KEY_GENERATED}" ]]; then
  php artisan storage:link
  php artisan db:seed
fi

php-fpm
