#!/bin/bash
chown -R $USER:$USER /var/www/project-site/html
chmod -R 755 /var/www/project-site/html
ln -s /etc/nginx/sites-available/project-site /etc/nginx/sites-enabled/
update-rc.d -f nginx enable
/etc/init.d/nginx start
nginx -t
