#!/usr/bin/env bash

cd $PROJECTMAPPINGFOLDER

# As we are doing build and up we might run here before the end of the entrypoint
while true ; do
    if [ -d /var/www/.composer ]; then
        if ls -la /var/www/.composer | grep -q "www-data"; then
            break
        fi
    fi
    echo -n "."
    sleep 2
done
echo ""
sleep 2

echo "Installation Composer in the container"
curl -sS https://getcomposer.org/installer | php

