FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git maven openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
