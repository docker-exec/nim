FROM        debian:8.0
MAINTAINER  andystanton
ENV         NIM_VERSION 0.10.2
RUN         apt-get update -qq && apt-get install -y patch gcc wget unzip && \
            wget http://nim-lang.org/download/nim-${NIM_VERSION}.zip && \
            unzip nim-${NIM_VERSION} && cd nim-${NIM_VERSION} && \
            chmod +x build.sh install.sh && \
            ./build.sh && \
            ./install.sh /usr/bin && \
            apt-get autoremove -y wget unzip && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD         image-common /tmp/dexec/image-common
ADD         dexec-nim.sh /tmp/dexec/dexec-nim.sh
VOLUME      /tmp/dexec/build
ENTRYPOINT  ["/tmp/dexec/dexec-nim.sh", "nim c --verbosity:0"]
