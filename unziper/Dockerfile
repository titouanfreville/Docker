FROM ubuntu

RUN apt-get update && apt-get install -y wget tar

WORKDIR /home/extract
VOLUME /home/extract
CMD wget -qO- http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz | tar -xz
