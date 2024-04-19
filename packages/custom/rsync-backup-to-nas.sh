#!/bin/sh
set -e

REMOTE=admin@nas.local
DIRECTORY=NetBackup/$(hostname)/$(date '+%Y-%m-%d')

ssh $REMOTE mkdir -p "/volume1/$DIRECTORY"
rsync -av -e ssh --no-links --human-readable --stats --progress \
    --include='/Desktop/' \
    --include='/Documents/' \
    --include='/Downloads/' \
    --include='/Music/' \
    --include='/org/' \
    --include='/Pictures/' \
    --include='/Public/' \
    --include='/Templates/' \
    --include='/Videos/' \
    --include='/.mozilla/firefox/managed/*.jsonlz4' \
    --include='/.mozilla/firefox/managed/*.sqlite' \
    --include='/.mozilla/firefox/managed/containers.json' \
    --include='/.mozilla/firefox/managed/key4.db' \
    --include='/.mozilla/firefox/managed/logins.json' \
    --exclude='.direnv/' \
    --exclude='node_modules/' \
    --exclude='/*' \
    "$HOME/" "$REMOTE::$DIRECTORY"
