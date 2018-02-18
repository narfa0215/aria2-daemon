#!/usr/bin/with-contenv bash

dockerize -template /app/aria2.conf /app/home/aria2.conf
dockerize -template /app/on-bt-download-complete.sh /app/home/config/on-bt-download-complete.sh
dockerize -template /app/on-download-complete.sh /app/home/config/on-download-complete.sh
dockerize -template /app/on-download-error.sh /app/home/config/on-download-error.sh
dockerize -template /app/on-download-pause.sh /app/home/config/on-download-pause.sh
dockerize -template /app/on-download-start.sh /app/home/config/on-download-start.sh
dockerize -template /app/on-download-stop.sh /app/home/config/on-download-stop.sh

# Create aria2.conf
if [ $aria2MaxConcurrentDownloads ]; then
	echo "max-concurrent-downloads=${aria2MaxConcurrentDownloads}" >> /app/home/aria2.conf
fi
if [ $aria2SeedRatio ]; then
	echo "seed-ratio=${aria2SeedRatio}" >> /app/home/aria2.conf
fi
if [ $aria2SeedTime ]; then
	echo "seed-time=${aria2SeedTime}" >> /app/home/aria2.conf
fi
if [ $aria2DisableIpv6 ]; then
	echo "disable-ipv6=${aria2DisableIpv6}" >> /app/home/aria2.conf
fi
if [ $aria2ForceSave ]; then
	echo "force-save=${aria2ForceSave}" >> /app/home/aria2.conf
fi
if [ $aria2MaxDownloadLimit ]; then
	echo "max-download-limit=${aria2MaxDownloadLimit}" >> /app/home/aria2.conf
fi
if [ $aria2MaxOverallDownloadLimit ]; then
	echo "max-overall-download-limit=${aria2MaxOverallDownloadLimit}" >> /app/home/aria2.conf
fi
if [ $aria2Continue ]; then
	echo "continue=${aria2Continue}" >> /app/home/aria2.conf
fi
if [ $aria2MinSplitSize ]; then
	echo "min-split-size=${aria2MinSplitSize}" >> /app/home/aria2.conf
fi
if [ $aria2Split ]; then
	echo "split=${aria2Split}" >> /app/home/aria2.conf
fi
if [ $aria2MaxConnectionPerServer ]; then
	echo "max-connection-per-server=${aria2MaxConnectionPerServer}" >> /app/home/aria2.conf
fi
if [ $aria2BtRequireCrypto ]; then
	echo "bt-require-crypto=${aria2BtRequireCrypto}" >> /app/home/aria2.conf
fi
if [ $aria2BtMinCryptoLevel ]; then
	echo "bt-min-crypto-level=${aria2BtMinCryptoLevel}" >> /app/home/aria2.conf
fi
if [ $aria2BtSaveMetadata ]; then
	echo "bt-save-metadata=${aria2BtSaveMetadata}" >> /app/home/aria2.conf
fi
if [ $aria2BtLoadSavedMetadata ]; then
	echo "bt-load-saved-metadata=${aria2BtLoadSavedMetadata}" >> /app/home/aria2.conf
fi
if [ $aria2SaveSessionInterval ]; then
	echo "save-session-interval=${aria2SaveSessionInterval}" >> /app/home/aria2.conf
fi
if [ $aria2ListenPort ]; then
	echo "listen-port=${aria2ListenPort}" >> /app/home/aria2.conf
fi
if [ $aria2EnableDht ]; then
	echo "enable-dht=${aria2EnableDht}" >> /app/home/aria2.conf
fi
if [ $aria2DhtListenPort ]; then
	echo "dht-listen-port=${aria2DhtListenPort}" >> /app/home/aria2.conf
fi

# Extra aria2 option file
if [ ! -f /app/home/config/aria2_ext.conf ]; then
	touch /app/home/config/aria2_ext.conf
fi
cat /app/home/config/aria2_ext.conf >> /app/home/aria2.conf

# Create hook files, if not exists
if [ ! -f /app/home/config/on-bt-download-complete.sh ]; then
	cp /app/on-bt-download-complete.sh /app/home/config/on-bt-download-complete.sh
fi
if [ ! -f /app/home/config/on-download-complete.sh ]; then
	cp /app/on-download-complete.sh /app/home/config/on-download-complete.sh
fi
if [ ! -f /app/home/config/on-download-error.sh ]; then
	cp /app/on-download-error.sh /app/home/config/on-download-error.sh
fi
if [ ! -f /app/home/config/on-download-pause.sh ]; then
	cp /app/on-download-pause.sh /app/home/config/on-download-pause.sh
fi
if [ ! -f /app/home/config/on-download-start.sh ]; then
	cp /app/on-download-start.sh /app/home/config/on-download-start.sh
fi
if [ ! -f /app/home/config/on-download-stop.sh ]; then
	cp /app/on-download-stop.sh /app/home/config/on-download-stop.sh
fi

if [ ! -f /app/home/aria2.session ]; then
	touch /app/home/aria2.session
fi

mkdir -p /home/app/download

chmod +x /etc/aria2/config/on-bt-download-complete.sh
chmod +x /etc/aria2/config/on-download-complete.sh
chmod +x /etc/aria2/config/on-download-error.sh
chmod +x /etc/aria2/config/on-download-pause.sh
chmod +x /etc/aria2/config/on-download-start.sh
chmod +x /etc/aria2/config/on-download-stop.sh

cat /app/home/aria2.conf

