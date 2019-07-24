FROM ubuntu:18.04

RUN apt-get update && apt-get install -y apt-mirror cron

COPY mirror.list /etc/apt/mirror.list

COPY crontab /etc/cron.d

ENTRYPOINT service cron start && crontab /etc/cron.d/* && /usr/bin/apt-mirror && tail -F /var/spool/apt-mirror/var/cron.log
