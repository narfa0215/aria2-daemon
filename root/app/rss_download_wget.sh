#!/bin/sh
while read p; do
   wget -O- --timeout=1 --waitretry=0 --tries=5 --retry-connrefused $p | grep -o '<link>.*torrent</link>' | sed -e 's/<[^>]*>//g' | while read line
   do
     #echo $line
     ruby /config/aria2rpc.ruby --server 127.0.0.1 --port 6800 --secret {{ default .Env.aria2Secret "YOUR_SECRET_CODE" }} addUri $line
   done
done </conf/rss_feeds.txt
