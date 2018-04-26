# CRM
### Apache config

```
<VirtualHost *:80>
        ServerName crm.local

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/crm/web

        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/var/www/crm/web">
            Options FollowSymLinks
            AllowOverride All

            Order allow,deny
            Allow from all
        </Directory>
</VirtualHost>
```