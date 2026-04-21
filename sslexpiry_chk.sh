#!/bin/bash

DOMAIN="example.com"

EXPIRY_DATE=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null \
| openssl x509 -noout -enddate | cut -d= -f2)

echo "Expiry Date: $EXPIRY_DATE"
