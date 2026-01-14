#!/bin/bash

WINDOWS_IP="192.168.40.133"
USER="rdpuser"
PASS="strong"

for i in {1..30}
do
  START=$(date +%s%3N)
  xfreerdp /v:$WINDOWS_IP /u:$USER /p:$PASS /cert:ignore /sec:nla /timeout:5000 >/dev/null 2>&1
  END=$(date +%s%3N)
  echo $((END - START))
  sleep 2
done


