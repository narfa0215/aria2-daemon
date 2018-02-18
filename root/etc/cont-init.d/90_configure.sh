#!/usr/bin/with-contenv bash

mkdir -p /home/app/config

dockerize -template /app/aria2.conf /home/app/aria2.conf
dockerize -template /app/on-bt-download-complete.sh /home/app/config/on-bt-download-complete.sh
dockerize -template /app/on-download-complete.sh /home/app/config/on-download-complete.sh
dockerize -template /app/on-download-error.sh /home/app/config/on-download-error.sh
dockerize -template /app/on-download-pause.sh /home/app/config/on-download-pause.sh
dockerize -template /app/on-download-start.sh /home/app/config/on-download-start.sh
dockerize -template /app/on-download-stop.sh /home/app/config/on-download-stop.sh

mkdir -p /home/app/download

chmod +x /etc/aria2/config/on-bt-download-complete.sh
chmod +x /etc/aria2/config/on-download-complete.sh
chmod +x /etc/aria2/config/on-download-error.sh
chmod +x /etc/aria2/config/on-download-pause.sh
chmod +x /etc/aria2/config/on-download-start.sh
chmod +x /etc/aria2/config/on-download-stop.sh

chown -R app:users /home/app

cat /app/home/aria2.conf

