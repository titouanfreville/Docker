FROM ubuntu

# Default url set to eclipse as it was created for an eclipse error helper.
ENV URL_TO_GET http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz

RUN apt-get update && apt-get install -y wget tar

WORKDIR /home/extract
VOLUME /home/extract
CMD wget -qO- $URL_TO_GET | tar -xz
