#!/bin/bash

#sudo apt-get update
#sudo apt-get upgrade
#sudo apt-get install phpmyadmin

PMAVERSION=$(grep PMAVERSION .env | cut -d '=' -f 2-)

cd /usr/share
echo 'go to' $PWD
EXIT
rm -rf phpmyadmin
echo 'remove folder phpmyadmin'

PMALINK="https://files.phpmyadmin.net/phpMyAdmin/$PMAVERSION/phpMyAdmin-$PMAVERSION-all-languages.zip"

wget -P /usr/share/ $PMALINK

echo "Extract files";
sleep 1
unzip phpMyAdmin-$PMAVERSION-all-languages.zip
cp -r phpMyAdmin-$PMAVERSION-all-languages phpmyadmin

echo "Clean files";
rm -rf phpMyAdmin-$PMAVERSION-all-languages
rm -rf phpMyAdmin-$PMAVERSION-all-languages.zip

echo "Config & blowfish_secret";
cd phpmyadmin
cp config.sample.inc.php config.inc.php
PMABLOWFISH=`head -c 512 /dev/urandom | md5sum | awk '{print $1}'`
sed -i -- 's/\['\''blowfish_secret'\''\] = '\'''\''/\['\''blowfish_secret'\''\] = '\'''$PMABLOWFISH''\''/' config.inc.php

mkdir tmp
chown -R www-data:www-data tmp

echo "Profit!!!"
