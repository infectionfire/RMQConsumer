FROM  ubuntu:20.04
WORKDIR /app
RUN apt-get update && apt-get -y install openjdk-11-jdk-headless && rm -rf /var/lib/apt
RUN   apt-get update && apt-get -y install software-properties-common && add-apt-repository ppa:libreoffice/ppa && \
        apt-get update && \
        apt-get -y -q install libreoffice

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

RUN  apt install -y \
        ttf-mscorefonts-installer \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
CMD ["bash"]