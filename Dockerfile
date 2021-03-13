FROM openjdk:11-jre-slim-buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends wget=1 \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN set -xo pipefail && wget -qO- "https://api.github.com/repos/AsamK/signal-cli/releases/latest" \
    | grep browser_download_url \
    | grep tar.gz\" \
    | cut -d '"' -f 4 \
    | wget -qi - -O signal-cli.tar.gz \
    && tar zxvpf signal-cli.tar.gz --strip 1 \
    && rm signal-cli.tar.gz

# Try to run it so we know it works
RUN /app/bin/signal-cli -v

WORKDIR /config

CMD ["sleep", "infinity"]
