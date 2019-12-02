#!/bin/bash

##
# PHPMYADMIN UPDATE SCRIPT
# https://github.com/sinbadxiii/pma-updater/
# Author: Sergey Mukhin
# Email: sinbadxiii@gmail.com
##

if [ ! -f .env ]; then
    cp .example.env .env
fi

# Output help
usage() {
    echo "usage: sudo ./update.sh [-h] [-r version]";
    echo "-h            this help";
    echo "-r version    choose a different version than the latest.";
}

PMAVERSION=$(grep PMAVERSION .env | cut -d '=' -f 2-)
PMALOCATION=$(grep PMALOCATION .env | cut -d '=' -f 2-)
PMADOMAIN=$(grep PMADOMAIN .env | cut -d '=' -f 2-)

while true
  do
      case "$1" in
          -r) PMAVERSION="$2"; shift;;
          -h|--help)
              usage
              exit;;
          --)
              shift
              break;;
      esac
      shift
      break
  done

PMALINK="$PMADOMAIN/$PMAVERSION/phpMyAdmin-$PMAVERSION-all-languages.zip"

cd /usr/share || exit
rm -rf phpmyadmin
echo 'Remove folder phpmyadmin'

wget -P $PMALOCATION $PMALINK

echo "Extract files";
sleep 1
unzip phpMyAdmin-$PMAVERSION-all-languages.zip
cp -r phpMyAdmin-$PMAVERSION-all-languages phpmyadmin

echo "Clean files";
rm -rf phpMyAdmin-$PMAVERSION-all-languages
rm -rf phpMyAdmin-$PMAVERSION-all-languages.zip

echo "Config & blowfish_secret";
cd phpmyadmin || exit
cp config.sample.inc.php config.inc.php
PMABLOWFISH=`head -c 512 /dev/urandom | md5sum | awk '{print $1}'`
sed -i -- 's/\['\''blowfish_secret'\''\] = '\'''\''/\['\''blowfish_secret'\''\] = '\'''$PMABLOWFISH''\''/' config.inc.php

mkdir tmp
chown -R www-data:www-data tmp

echo "Profit!!!"
