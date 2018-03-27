#!/bin/sh
file=/conf/rss_memory.txt

if [ ! -e "$file" ] ; then
  touch $file
fi

while read p; do
   curl $p | grep -o '<link>.*torrent</link>' | sed -e 's/<[^>]*>//g' | while read line
   do
     #echo $line
     if grep -Fxq "$line" $file ; then
       echo Exist already: $line
     else
       ruby /config/aria2rpc.ruby --server 127.0.0.1 --port 6800 --secret {{ default .Env.aria2Secret "YOUR_SECRET_CODE" }} addUri $line
       echo $line >> $file
     fi
   done
   sleep 2
done </conf/rss_feeds.txt
