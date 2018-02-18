#!/usr/bin/with-contenv bash

mkdir -p /config_int
mkdir -p /config

dockerize -template /app/aria2.conf /config_int/aria2.conf
dockerize -template /app/on-bt-download-complete.sh /config/on-bt-download-complete.sh
dockerize -template /app/on-download-complete.sh /config/on-download-complete.sh
dockerize -template /app/on-download-error.sh /config/on-download-error.sh
dockerize -template /app/on-download-pause.sh /config/on-download-pause.sh
dockerize -template /app/on-download-start.sh /config/on-download-start.sh
dockerize -template /app/on-download-stop.sh /config/on-download-stop.sh

mkdir -p /home/app/download

chmod +x /config/on-bt-download-complete.sh
chmod +x /config/on-download-complete.sh
chmod +x /config/on-download-error.sh
chmod +x /config/on-download-pause.sh
chmod +x /config/on-download-start.sh
chmod +x /config/on-download-stop.sh

chown -R app:users /config_int
chown -R app:users /config

cat /config_int/aria2.conf

