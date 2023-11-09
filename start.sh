#!/bin/sh

# Disbale memry overcommit
sysctl vm.overcommit_memory=1 &&

# Set clock sources
echo xen > /sys/devices/system/clocksource/clocksource0/current_clocksource &&

# Disable Transparent Huge Pages
echo madvise > /sys/kernel/mm/transparent_hugepage/enabled &&

# Start Redis server
redis-server &

# Start Xen Orchestra
#yarn --cwd /xen-orchestra/packages/xo-server start

cd /xen-orchestra/packages/xo-server/ &&
service orchestra start

# Keep the script running to keep the container alive
tail -f /dev/null
