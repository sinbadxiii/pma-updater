# phpMyAdmin Updater
Script for automatically installing/updating the latest phpMyAdmin version.

### This Bash script will do the following.

* Remove any old phpMyAdmin files from '/usr/share/phpmyadmin' if there are any.
* Download the latest version of phpMyAdmin from phpMyAdmin site.
* Extract the downloaded `.zip` file in the current folder.
* Copy `config.sample.inc.php` to `config.inc.php`.
* Automatically update the `'blowfish_secret'` in `config.inc.php` using an `md5sum` of 512 bytes received from `/dev/urandom`.
* Clean up by removing the downloaded `.zip` file

### Installing
To use it, simply drop the following commands in your terminal.

`git clone https://github.com/sinbadxiii/pma-updater && (cd pmaupdater && ./pmaupdater)`

##### Make sure you don't have already a file or folder with the name `pmaupdater.zip` or `pmaupdater` as it will be overwritten!

You can rename the `pmaupdater` folder, to whatever name you want to use when accessing it from your web server.

### Updating
Once you have downloaded `pmaupdater`, you can update the phpMyAdmin version by going to the `pmaupdater` folder and running the script

`./pmaupdater`
