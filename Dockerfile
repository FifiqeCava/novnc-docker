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

RUN   pip uninstall pillow --break-system-packages \
      pip uninstall pyyaml --break-system-packages \
      pip uninstall pygment --break-system-packages \
      pip uninstall cryptography --break-system-packages 

RUN   pip install pillow>=10.0.1 --break-system-packages \
      pip install pyyaml>=5.4 --break-system-packages 

RUN   pip install pygment>=2.7.4 --break-system-packages \
      pip install cryptography>=41.0.4 --break-system-packages 

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