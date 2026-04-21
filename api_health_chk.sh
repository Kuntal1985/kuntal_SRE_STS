#!/bin/bash

URL="https://api.example.com/health"
THRESHOLD=3
FAIL_COUNT=0

while true; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

  if [ "$STATUS" -eq 200 ]; then
    echo " API Healthy"
    FAIL_COUNT=0
  else
    echo " API Issue: $STATUS"
    ((FAIL_COUNT++))
  fi

  if [ "$FAIL_COUNT" -ge "$THRESHOLD" ]; then
    echo " ALERT: API is DOWN!"
    # Example: send alert
    # curl -X POST -H 'Content-type: application/json' \
    # --data '{"text":"API Down"}' <SLACK_WEBHOOK>
    FAIL_COUNT=0
  fi

  sleep 30
done
