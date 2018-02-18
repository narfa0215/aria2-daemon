#!/usr/bin/with-contenv bash

mkdir -p /config
mkdir -p /conf
mkdir -p /download

dockerize -template /app/start.sh:/config/start.sh
dockerize -template /app/aria2.conf:/config/aria2.conf
dockerize -no-overwrite -template /app/aria2_ext.conf:/conf/aria2_ext.conf
dockerize -no-overwrite -template /app/on-bt-download-complete.sh:/conf/on-bt-download-complete.sh
dockerize -no-overwrite -template /app/on-download-complete.sh:/conf/on-download-complete.sh
dockerize -no-overwrite -template /app/on-download-error.sh:/conf/on-download-error.sh
dockerize -no-overwrite -template /app/on-download-pause.sh:/conf/on-download-pause.sh
dockerize -no-overwrite -template /app/on-download-start.sh:/conf/on-download-start.sh
dockerize -no-overwrite -template /app/on-download-stop.sh:/conf/on-download-stop.sh

cat /conf/aria2_ext.conf >> /config/aria2.conf

if [ ! -f /conf/aria2.session ]; then
	touch /conf/aria2.session
fi

chmod +x /config/start.sh
chmod +x /conf/on-bt-download-complete.sh
chmod +x /conf/on-download-complete.sh
chmod +x /conf/on-download-error.sh
chmod +x /conf/on-download-pause.sh
chmod +x /conf/on-download-start.sh
chmod +x /conf/on-download-stop.sh

chown -R app:users /download
chown -R app:users /config
chown -R app:users /conf

#cat /config/aria2.conf

