#!/bin/sh
set -e

apt-get update
apt-get install -y gosu
rm -rf /var/lib/apt/lists/*

OLD_USER="$1"

if [ -n "$OLD_USER" ] && getent passwd "$OLD_USER" > /dev/null 2>&1; then
    groupmod -n penguin "$OLD_USER"
    usermod -l penguin -d /home/penguin -m "$OLD_USER"
else
    groupadd -r penguin
    useradd -r -m -g penguin -s /bin/bash penguin
fi
