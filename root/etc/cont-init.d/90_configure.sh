#!/usr/bin/with-contenv bash

dockerize -template /app/aria2.conf /app/home/aria2.conf
dockerize -template /app/on-bt-download-complete.sh /app/home/config/on-bt-download-complete.sh
dockerize -template /app/on-download-complete.sh /app/home/config/on-download-complete.sh
dockerize -template /app/on-download-error.sh /app/home/config/on-download-error.sh
dockerize -template /app/on-download-pause.sh /app/home/config/on-download-pause.sh
dockerize -template /app/on-download-start.sh /app/home/config/on-download-start.sh
dockerize -template /app/on-download-stop.sh /app/home/config/on-download-stop.sh

mkdir -p /home/app/download

chmod +x /etc/aria2/config/on-bt-download-complete.sh
chmod +x /etc/aria2/config/on-download-complete.sh
chmod +x /etc/aria2/config/on-download-error.sh
chmod +x /etc/aria2/config/on-download-pause.sh
chmod +x /etc/aria2/config/on-download-start.sh
chmod +x /etc/aria2/config/on-download-stop.sh

chown -R app:app /home/app

cat /app/home/aria2.conf

