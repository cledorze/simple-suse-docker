#!/bin/bash
chown www-data:www-data /app -R
a2enmod mod_php5
a2enmod rewrite
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
    a2enmod rewrite mod_php5
fi
#source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
