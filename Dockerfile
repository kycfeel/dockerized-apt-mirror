FROM ubuntu:18.04

RUN apt-get update && apt-get install -y apt-mirror

COPY mirror.list /etc/apt/mirror.list

ENTRYPOINT ["apt-mirror"]