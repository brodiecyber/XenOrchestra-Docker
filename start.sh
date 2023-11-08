#!/bin/sh

# Start Redis server
redis-server &

# Start Xen Orchestra
#yarn --cwd /xen-orchestra/packages/xo-server start
cd /xen-orchestra/packages/xo-server/ &&
service orchestra start

# Keep the script running to keep the container alive
tail -f /dev/null
