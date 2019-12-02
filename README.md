# phpMyAdmin Updater
Script for automatically updating the latest phpMyAdmin version.

## Requirements
- wget
- unzip

### This Bash script will do the following.

* Remove any old phpMyAdmin files from '/usr/share/phpmyadmin' if there are any.
* Download the latest version of phpMyAdmin from phpMyAdmin site.
* Extract the downloaded `.zip` file in the current folder.
* Copy `config.sample.inc.php` to `config.inc.php`.
* Automatically update the `'blowfish_secret'` in `config.inc.php` using an `md5sum` of 512 bytes received from `/dev/urandom`.
* Clean up by removing the downloaded `.zip` file

### Installing
To use it, simply drop the following commands in your terminal.

`git clone https://github.com/sinbadxiii/pma-updater && cd pma-updater`


### Usage

run to update to the latest stable version `sudo ./update.sh`

run with the `-r` key to install another version `sudo ./update.sh -r 4.9.1`

### Updating
Once you have downloaded `pma-updater`, you can update the phpMyAdmin version by going to the `pma-updater` folder and running the script

