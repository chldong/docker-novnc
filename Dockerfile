FROM alpine:3.12
LABEL maintainer=cuihailiang@gmail.com

ENV HOME=/root \
	DEBIAN_FRONTEND=noninteractive \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	REMOTE_HOST=docker-ubuntu-vnc \
	REMOTE_PORT=5901

RUN apk --update --upgrade add git bash supervisor py-pip \
	&& git clone https://github.com/novnc/noVNC.git /root/noVNC \
	&& git clone https://github.com/novnc/websockify /root/noVNC/utils/websockify \
	&& rm -rf /root/noVNC/.git \
	&& rm -rf /root/noVNC/utils/websockify/.git \
	&& cd /root/noVNC \
	&& sed -i -- "s/ps -p/ps -o pid | grep/g" /root/noVNC/utils/launch.sh \
	&& cp /usr/bin/python3 /usr/bin/python \
	&& apk del git

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8081

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
