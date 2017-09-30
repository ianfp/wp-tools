#!/bin/bash

site=${1%/}
if [[ ! -d $site ]]; then
    echo "No such site '$site'"
    exit
fi

base=`dirname $site`
name=`basename $site`
echo "Site is $site; site name is $name"

tar -C $base -cf $HOME/${name}.tar $name
mysqldump $name > $HOME/${name}.sql
