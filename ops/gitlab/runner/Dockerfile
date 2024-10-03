FROM debian:latest

RUN apt-get update -y \
    && apt-get install -y \
        curl \
        git \
        gnupg \
        build-essential \
        apt-transport-https \
        ca-certificates \
        software-properties-common

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update -y
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

WORKDIR /gitlab-runner

RUN curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 \
    && chmod +x /usr/local/bin/gitlab-runner

RUN useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

RUN gitlab-runner install --user=gitlab-runner --working-directory=/gitlab-runner \
    && gitlab-runner start

COPY start.sh ./

RUN chmod +x start.sh

CMD ["./start.sh"]