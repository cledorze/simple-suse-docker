#!/bin/bash
chown www-data:www-data /app -R
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
fi
#source /etc/apache2/envvars
