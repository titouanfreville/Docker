FROM debian:jessie
MAINTAINER FREVILLE Titouan <tfreville@nexway.com>
# Installations ---------------------------------
RUN apt-get update && apt-get install -yy figlet whiptail mysql-client && rm -rf /var/lib/apt/lists/*
# -----------------------------------------------
# GOSU Installation -----------------------------
ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/*\
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true
# -----------------------------------------------
# Add whipt scripts -----------------------------
ADD whiptails.sh  /bin/whiptails
# -----------------------------------------------
# Configure container ---------------------------
RUN useradd whiptails
VOLUME ["/home/run"]
WORKDIR /home/run
USER whiptails
# -----------------------------------------------
# Base cmd to explain how it work ---------------
CMD figlet "Wipthails Container"; \
    echo "This container is used to run whiptails scripts from docker."; \
    echo "Usage : "; \
    echo "Mount the code using whiptails you want to execute with -v YOUR_CODE_PATH:/home/run"; \
    echo "In the script, add source whiptails"; \
    echo "Provided whiptails scripts : "; \
    echo "init_select -- usage: init_select BACKTITLE TITLE QUESTION OPTIONS (HEIGHT) (WIDTH) (SPACE_BEFORE_OPTION)"; \
    echo "init_inputbox -- usage: init_inputbox BACKTITLE TITLE QUESTION (HEIGHT) (WIDTH) (DEFAULT_TEXT)"; \
    echo "init_checklist -- usage: init_checklist BACKTITLE TITLE QUESTION OPTIONS_TABLE (HEIGHT) (WIDTH) (SPACE_BEFORE_OPTION)";
