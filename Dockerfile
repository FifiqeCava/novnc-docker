FROM debian:bullseye-slim
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      git \
      net-tools \
      novnc \
      supervisor \
      xterm 

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=no \
    RUN_FLUXBOX=no

COPY . /novnc-docker

CMD ["/novnc-docker/app/entrypoint.sh"]
EXPOSE 8080