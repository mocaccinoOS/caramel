#!/bin/bash

exec /bin/tini -s -- supervisord -n -c /etc/supervisor/supervisord.conf