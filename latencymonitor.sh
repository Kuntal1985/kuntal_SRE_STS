#!/bin/bash

URL="https://example.com"

RESPONSE_TIME=$(curl -o /dev/null -s -w '%{time_total}' $URL)

echo "Response Time: $RESPONSE_TIME sec"

THRESHOLD=2

if (( $(echo "$RESPONSE_TIME > $THRESHOLD" | bc -l) )); then
  echo "High latency detected!"
fi
