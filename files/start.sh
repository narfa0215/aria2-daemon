#!/bin/sh

# Change user and group id
#if [ $aria2UID ]; then
#usermod -i ${aria2UID} app
#fi
#if [ $aria2GID ]; then
#usermod -i ${aria2GID} app
#fi

chown -R app:app /home/app/conf
chown -R app:app /home/app/conf-copy
chown -R app:app /home/app/data
#RUN chown -R app:app /home/app/download

# Create aria2.conf
cp -f /home/app/conf-copy/aria2.conf /home/app/conf/aria2.conf
if [ $aria2Secret ]; then
	echo "rpc-secret=${aria2Secret}" >> /home/app/conf/aria2.conf
fi
if [ $aria2MaxConcurrentDownloads ]; then
	echo "max-concurrent-downloads=${aria2MaxConcurrentDownloads}" >> /home/app/conf/aria2.conf
fi
if [ $aria2SeedRatio ]; then
	echo "seed-ratio=${aria2SeedRatio}" >> /home/app/conf/aria2.conf
fi
if [ $aria2SeedTime ]; then
	echo "seed-time=${aria2SeedTime}" >> /home/app/conf/aria2.conf
fi
if [ $aria2DisableIpv6 ]; then
	echo "disable-ipv6=${aria2DisableIpv6}" >> /home/app/conf/aria2.conf
fi
if [ $aria2ForceSave ]; then
	echo "force-save=${aria2ForceSave}" >> /home/app/conf/aria2.conf
fi
if [ $aria2MaxDownloadLimit ]; then
	echo "max-download-limit=${aria2MaxDownloadLimit}" >> /home/app/conf/aria2.conf
fi
if [ $aria2MaxOverallDownloadLimit ]; then
	echo "max-overall-download-limit=${aria2MaxOverallDownloadLimit}" >> /home/app/conf/aria2.conf
fi
if [ $aria2Continue ]; then
	echo "continue=${aria2Continue}" >> /home/app/conf/aria2.conf
fi
if [ $aria2MinSplitSize ]; then
	echo "min-split-size=${aria2MinSplitSize}" >> /home/app/conf/aria2.conf
fi
if [ $aria2Split ]; then
	echo "split=${aria2Split}" >> /home/app/conf/aria2.conf
fi
if [ $aria2MaxConnectionPerServer ]; then
	echo "max-connection-per-server=${aria2MaxConnectionPerServer}" >> /home/app/conf/aria2.conf
fi
if [ $aria2BtRequireCrypto ]; then
	echo "bt-require-crypto=${aria2BtRequireCrypto}" >> /home/app/conf/aria2.conf
fi
if [ $aria2BtMinCryptoLevel ]; then
	echo "bt-min-crypto-level=${aria2BtMinCryptoLevel}" >> /home/app/conf/aria2.conf
fi
if [ $aria2BtSaveMetadata ]; then
	echo "bt-save-metadata=${aria2BtSaveMetadata}" >> /home/app/conf/aria2.conf
fi
if [ $aria2BtLoadSavedMetadata ]; then
	echo "bt-load-saved-metadata=${aria2BtLoadSavedMetadata}" >> /home/app/conf/aria2.conf
fi
if [ $aria2SaveSessionInterval ]; then
	echo "save-session-interval=${aria2SaveSessionInterval}" >> /home/app/conf/aria2.conf
fi
if [ $aria2ListenPort ]; then
	echo "listen-port=${aria2ListenPort}" >> /home/app/conf/aria2.conf
fi
if [ $aria2EnableDht ]; then
	echo "enable-dht=${aria2EnableDht}" >> /home/app/conf/aria2.conf
fi
if [ $aria2DhtListenPort ]; then
	echo "dht-listen-port=${aria2DhtListenPort}" >> /home/app/conf/aria2.conf
fi

# Extra aria2 option file
if [ ! -f /home/app/conf/aria2_ext.conf ]; then
	touch /home/app/conf/aria2_ext.conf
fi
cat /home/app/conf/aria2_ext.conf >> /home/app/conf/aria2.conf

# Create hook files, if not exists
if [ ! -f /home/app/conf/on-bt-download-complete.sh ]; then
	cp /home/app/conf-copy/on-bt-download-complete.sh /home/app/conf/on-bt-download-complete.sh
fi
if [ ! -f /home/app/conf/on-download-complete.sh ]; then
	cp /home/app/conf-copy/on-download-complete.sh /home/app/conf/on-download-complete.sh
fi
if [ ! -f /home/app/conf/on-download-error.sh ]; then
	cp /home/app/conf-copy/on-download-error.sh /home/app/conf/on-download-error.sh
fi
if [ ! -f /home/app/conf/on-download-pause.sh ]; then
	cp /home/app/conf-copy/on-download-pause.sh /home/app/conf/on-download-pause.sh
fi
if [ ! -f /home/app/conf/on-download-start.sh ]; then
	cp /home/app/conf-copy/on-download-start.sh /home/app/conf/on-download-start.sh
fi
if [ ! -f /home/app/conf/on-download-stop.sh ]; then
	cp /home/app/conf-copy/on-download-stop.sh /home/app/conf/on-download-stop.sh
fi

chmod +x /home/app/conf/on-bt-download-complete.sh
chmod +x /home/app/conf/on-download-complete.sh
chmod +x /home/app/conf/on-download-error.sh
chmod +x /home/app/conf/on-download-pause.sh
chmod +x /home/app/conf/on-download-start.sh
chmod +x /home/app/conf/on-download-stop.sh

if [ ! -f /home/app/conf/aria2.session ]; then
	touch /home/app/conf/aria2.session
fi

cat /home/app/conf/aria2.conf


# Start aria2
su - app -c "aria2c --conf-path=/home/app/conf/aria2.conf"
