FROM node:14

RUN apt update && \
    apt install -y ca-certificates curl gnupg wget build-essential dirmngr apt-transport-https lsb-release

RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz && \
    tar xzf Python-2.7.18.tgz && \
    cd Python-2.7.18 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    ln -sfn /usr/local/bin/python2.7 /usr/bin/python2 && \
    cd .. && rm -rf Python-2.7.18 Python-2.7.18.tgz