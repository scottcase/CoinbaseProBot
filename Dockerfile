FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# global environment settings
ENV DEBIAN_FRONTEND="noninteractive"

RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install -y \
	nano \
	git \
	zip \
	udev \
	unrar \
	wget && \
 echo "**** install plex ****" && \

 curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
 apt-get install -y nodejs && \

 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
#VOLUME /config
