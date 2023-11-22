FROM ubuntu:rolling

RUN set -ex; \
    apt-get update; \
    apt-get install --no-install-recommends -y \
      bash \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      fluxbox \
      xvfb; \
      git clone https://github.com/aarsht7/novnc-docker; \
      chmod +x /novnc-docker/app/entrypoint.sh; \
      rm -rf /var/lib/apt/lists/*
      

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

CMD ["/novnc-docker/app/entrypoint.sh"]
EXPOSE 8080