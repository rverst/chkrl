#! /usr/bin/env bash

if [ ! -f "$FILE" ]; then
    echo 0 > "$FILE"
fi

for(( ; ; )); do
  ./check.sh
  if [ $? -eq 1 ]; then
    exit 0
  fi
  sleep $INTERVAL
done
