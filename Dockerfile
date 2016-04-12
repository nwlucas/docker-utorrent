FROM nwlucas/docker-baseimage:0.9.18
MAINTAINER Nigel Williams-Lucas <admin@nwlnexus.net>

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN locale-gen en_US.UTF-8 && \
      mkdir -p /app/utserver && \
      apt-get -q update && apt-get install -qy libssl1.0.0 libssl-dev && \
      curl -o /tmp/utserver.tar.gz -L 'http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04' && \
      tar -xf /tmp/utserver.tar.gz -C /app/utserver --strip-components=1 && \
      cd /tmp && \
      apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD default/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh && \
    usermod -d /config/utserver baca

EXPOSE 8888 6881
VOLUME ["/config", "/downloads", "/downloads-complete", "data"]