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
      xterm \
      python3-pip

RUN   pip install pillow --upgrade \
      pip install pyyaml --upgrade \
      pip install pygment --upgrade \
      pip install cryptography --upgrade 

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