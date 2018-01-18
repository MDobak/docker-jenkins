FROM jenkins/jenkins:2.102

USER root

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
    apt-get update && apt-get install -y docker-ce && \
    usermod -aG docker,staff jenkins && \
    chmod g+s /usr/bin/docker

USER jenkins
