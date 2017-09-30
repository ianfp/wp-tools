#!/bin/bash

site=${1%/}
if [[ ! -d $site ]]; then
    echo "No such directory '$site'"
    exit
fi

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
sudo rsync -rvu wordpress/ $site
# Remove Hello Dolly plugin, with prejudice.
sudo rm $site/wp-content/plugins/hello.php
rm -f latest.tar.gz
