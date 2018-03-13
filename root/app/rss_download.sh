#!/bin/sh
xmlgetnext () {
   local IFS='>'
   read -d '<' TAG VALUE
}
while read p; do
   curl $p | while xmlgetnext ; do
      case $TAG in
         'link')
   	    ruby aria2rpc --server 127.0.0.1 --port 6800 --secret {{ default .Env.aria2Secret "YOUR_SECRET_CODE" }} addUri $VALUE
   	    ;;
         esac
   done
done <rss_feeds.txt
