# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ubuntu:18.04

LABEL       author="Pterodactyl Software" maintainer="support@pterodactyl.io"

ENV         DEBIAN_FRONTEND noninteractive
# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl gcc g++ iproute2 telnet net-tools netcat libfontconfig \
            libgcc1 lib32z1 libcurl4-gnutls-dev:i386 libtinfo5:i386 libsdl1.2debian lib32stdc++6 libcurl4:i386 libcurl3-gnutls:i386 libncurses5:i386 lib32gcc1 gdb lib32tinfo5 \
            libasound2 libxss1 libpangocairo-1.0-0 libxcomposite1 libxi6 libfontconfig libssl1.0.0:i386 libxdamage1 libfontconfig1 libatk1.0-0 libgconf2-4 libxcursor1 libxtst6 libxrandr2 libnss3 \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
