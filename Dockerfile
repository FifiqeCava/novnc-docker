FROM debian:stable-slim

RUN set -ex; \
    apt-get update; \
    apt-get upgrade; \
    apt-get install -y \
      bash \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      fluxbox \
      xvfb

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes

RUN git clone https://github.com/aarsht7/novnc-docker

CMD ["/novnc-docker/app/entrypoint.sh"]
EXPOSE 8080