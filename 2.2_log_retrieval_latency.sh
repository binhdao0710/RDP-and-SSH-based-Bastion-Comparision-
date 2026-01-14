#!/bin/bash

echo "READY" >&2

for i in {1..30}
do
  BEFORE=$(sudo journalctl -u ssh | grep -c Accepted)

  START=$(date +%s%3N)

  while true
  do
    AFTER=$(sudo journalctl -u ssh | grep -c Accepted)
    if [ "$AFTER" -gt "$BEFORE" ]; then
      break
    fi
    sleep 0.01
  done

  END=$(date +%s%3N)
  echo $((END - START))
done
