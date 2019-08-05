#!/usr/bin/env zsh

echo "Fixing includes from headers listed in $1"

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for i in $(cat < "$1"); do
  echo "Processing file: $i"
  FIXED_FILE_CONTENT=$(sed -E 's|include <openssl/(.*)>|include "openssl/\1"|g' "$i")
  echo $FIXED_FILE_CONTENT > "$i"
done
