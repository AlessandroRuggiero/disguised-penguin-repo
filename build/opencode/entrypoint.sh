#!/bin/bash
set -e

# Provide fallback IDs (defaults to 1000) if PUID/PGID are not set
USER_ID=${PUID:-1000}
GROUP_ID=${PGID:-1000}

# Modify the internal 'penguin' user and group to map to the host's UID/GID
# The -o flag allows using a non-unique UID/GID (just in case)
groupmod -o -g "$GROUP_ID" penguin
usermod -o -u "$USER_ID" penguin

# Ensure the home directory is owned by the newly mapped user
chown -R penguin:penguin /home/penguin

# Drop root privileges and execute the main container command as 'penguin'
# "$@" represents the arguments passed by Docker (e.g., 'bash', 'npm start', etc.)
exec gosu penguin "$@"