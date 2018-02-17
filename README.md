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
-e PGID=100 \
-e PUID=1001 \
fanningert/aria2-daemon
```

### Build:  
`sudo docker build -f Dockerfile -t fanningert/aria2-daemon .`  

### Link:  
https://github.com/aria2/aria2  

## User / Group Identifiers

**Note:** (This section stolen from [LinuxServer.io](http://linuxserver.io)'s
excellent container documentation.)

Sometimes when using data volumes (`-v` flags) permissions issues can arise
between the host OS and the container. We avoid this issue by allowing you to
specify the user PUID and group PGID. Ensure the data volume directory on the
host is owned by the same user you specify and it will "just work" TM.

In this instance `PUID=1001` and `PGID=1001`. To find yours use id user as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```
