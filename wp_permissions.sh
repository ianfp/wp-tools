#!/bin/bash

OWNER=aliko98
WEB=www-data

site=${1%/}
echo "Setting permissions for $site..."

if [[ ! -d $site ]]; then
    echo "No such directory '$site'"
    return
fi

sudo find $site -type d -exec chmod 775 {} \;
sudo find $site -type f -exec chmod 664 {} \;

sudo chown -R $OWNER:$OWNER $site
sudo chown -R $WEB:$OWNER $site/wp-content
