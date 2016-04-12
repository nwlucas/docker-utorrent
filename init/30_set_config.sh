#!/bin/bash

mkdir -p /downloads /downloads-complete /data

[[ ! -f /config/utserver.conf ]] && cp /defaults/utserver.conf /config/utserver.conf
[[ ! -f /config/utserver.log ]] && touch /config/utserver.log

chown baca:baca /downloads /config /downloads-complete /data