#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100.0}')
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU: $CPU%"
echo "Memory: $MEM%"
echo "Disk: $DISK%"

if (( $(echo "$CPU > 85" | bc -l) )) || (( $(echo "$MEM > 90" | bc -l) )) || [ "$DISK" -gt 90 ]; then
  echo "🚨 High Resource Usage!"
fi
