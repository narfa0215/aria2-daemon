FROM fanningert/baseimage-alpine

MAINTAINER fanningert <thomas@fanninger.at>

RUN apk update && \
	apk add --no-cache --update bash && \
	apk add --no-cache --update aria2

ADD root/ /

RUN chmod -v +x /etc/services.d/*/run /etc/cont-init.d/*

VOLUME ["/home/app/download"]
VOLUME ["/etc/aria2/conf"]
EXPOSE 6800
