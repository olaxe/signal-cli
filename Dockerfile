FROM openjdk:11-jre-slim-buster
MAINTAINER olaxe

RUN apt update && apt -y upgrade \
    && apt -y install curl
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN curl --silent "https://api.github.com/repos/AsamK/signal-cli/releases/latest" \
    | grep browser_download_url \
    | grep tar.gz\" \
    | cut -d '"' -f 4 \
    | wget -qi - -O signal-cli.tar.gz \
    && tar zxvpf signal-cli.tar.gz \
    && rm signal-cli.tar.gz

# Try to run it so we know it works
RUN signal-cli -v

WORKDIR /config

CMD ["sleep", "infinity"]
