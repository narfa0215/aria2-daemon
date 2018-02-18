Aria2 with webui for unRaid
---
Only 11Mb. Inspired by XUJINKAI.  

Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name unraid-aria2-with-webui \
-p 6800:6800 \
-v /CONFIG_DIR:/conf \
-v /DOWNLOAD_DIR:=/download \
-e SECRET=YOUR_SECRET_CODE \
-e PGID=911 \
-e PUID=911 \
fanningert/aria2-daemon
```

### Build:  
`sudo docker build -f Dockerfile -t fanningert/aria2-daemon .`  

### Link:  
https://github.com/aria2/aria2  
