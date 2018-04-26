#!/usr/bin/env bash

#== Bash helpers ==

function info {
  echo " "
  echo "--> $1"
  echo " "
}

#== Provision script ==

info "Provision-script user: `whoami`"

export DEBIAN_FRONTEND=noninteractive

info "Configure timezone"
timedatectl set-timezone Europe/Kiev

info "Prepare root password for MySQL"
debconf-set-selections <<< "mysql-server mysql-server/root_password root ''"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again root ''"
echo "Done!"

info "Update OS software"
apt-get install software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get upgrade -y
echo "Done!"

info "Installing Apache"
apt-get install -y apache2
echo "Done!"

info "Install php 7.2"
apt-get install -y php-pear php7.2-curl php7.2-dev libapache2-mod-php7.2 php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml unzip php.xdebug
echo "Done!"

info "Installing Mysql 5.7"
#wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
#sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-get update
sudo apt-get install mysql-server mysql-client

service mysql restart
echo "Done!"

info "Configure MySQL"
#sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -uroot <<< "CREATE USER 'root'@'%' IDENTIFIED BY ''"
mysql -uroot <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"
mysql -uroot <<< "DROP USER 'root'@'localhost'"
mysql -uroot <<< "FLUSH PRIVILEGES"
service mysql restart
echo "Done!"


info "Enabling site configuration"
cp /var/www/crm/vagrant/apache/crm.conf /etc/apache2/sites-enabled/
a2enmod rewrite && sudo service apache2 restart
echo "Done!"

info "Initailize databases for MySQL"
mysql -uroot <<< "CREATE DATABASE crm"
mysql -uroot <<< "CREATE USER 'crm'@'%' IDENTIFIED BY 'crm_pass'"
mysql -uroot <<< "GRANT ALL PRIVILEGES ON *.* TO 'crm'@'localhost'"
mysql -uroot <<< "FLUSH PRIVILEGES"
mysql -uroot -p crm -Proot < /var/www/crm/dump.sql

echo "Done!"

info "Install composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer