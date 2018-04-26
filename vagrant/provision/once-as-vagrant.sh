#!/usr/bin/env bash
#== Bash helpers ==

function info {
  echo " "
  echo "--> $1"
  echo " "
}

#== Provision script ==

info "Provision-script user: `whoami`"

info "Install project dependencies"
cd /var/www/crm
composer --no-progress --prefer-dist install

info "Create bash-alias 'crm' for vagrant user"
echo 'alias crm="cd /var/www/crm"' | tee /home/vagrant/.bash_aliases

info "Enabling colorized prompt for guest console"
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /home/vagrant/.bashrc
