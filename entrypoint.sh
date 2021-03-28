#!/bin/bash

service ssh restart
source /root/grim-reaper.sh
exec "$@"
