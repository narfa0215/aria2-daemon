FROM alpine:edge

MAINTAINER fanningert <thomas@fanninger.at>

RUN addgroup -S app \
    && adduser -S -G app -h /home/app -D app

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /home/app/conf && \
	mkdir -p /home/app/conf-copy && \
	mkdir -p /home/app/data && \
	mkdir -p /home/app/download && \
	apk add --no-cache --update aria2

ADD files/start.sh /home/app/conf-copy/start.sh
ADD files/aria2.conf /home/app/conf-copy/aria2.conf
ADD files/on-bt-download-complete.sh /home/app/conf-copy/on-bt-download-complete.sh
ADD files/on-download-complete.sh /home/app/conf-copy/on-download-complete.sh
ADD files/on-download-error.sh /home/app/conf-copy/on-download-error.sh
ADD files/on-download-pause.sh /home/app/conf-copy/on-download-pause.sh
ADD files/on-download-start.sh /home/app/conf-copy/on-download-start.sh
ADD files/on-download-stop.sh /home/app/conf-copy/on-download-stop.sh

RUN chmod +x /home/app/conf-copy/start.sh

WORKDIR /home/app
VOLUME ["/home/app/download"]
VOLUME ["/home/app/conf"]
EXPOSE 6800

CMD ["/home/app/conf-copy/start.sh"]
