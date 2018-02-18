#!/usr/bin/with-contenv bash

dockerize -template /app/start.sh /etc/aria2/start.sh
dockerize -template /app/aria2.conf /etc/aria2/aria2.conf
dockerize -template /app/on-bt-download-complete.sh /etc/aria2/config/on-bt-download-complete.sh
dockerize -template /app/on-download-complete.sh /etc/aria2/config/on-download-complete.sh
dockerize -template /app/on-download-error.sh /etc/aria2/config/on-download-error.sh
dockerize -template /app/on-download-pause.sh /etc/aria2/config/on-download-pause.sh
dockerize -template /app/on-download-start.sh /etc/aria2/config/on-download-start.sh
dockerize -template /app/on-download-stop.sh /etc/aria2/config/on-download-stop.sh

chmod +x /etc/aria2/config/on-bt-download-complete.sh
chmod +x /etc/aria2/config/on-download-complete.sh
chmod +x /etc/aria2/config/on-download-error.sh
chmod +x /etc/aria2/config/on-download-pause.sh
chmod +x /etc/aria2/config/on-download-start.sh
chmod +x /etc/aria2/config/on-download-stop.sh

