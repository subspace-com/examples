#!/bin/sh

token=${token:-`token`}

read -r -d '' data <<EOF
{
    "destination_group_id": "$glb_group_id",
    "name": "SJC01",
    "ip": "129.203.99.1",
    "port": 32261,
    "enabled": "ENABLED"
}
EOF

set -e

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  -d "$data" \
  "https://api.subspace.com:443/v1/loadbalancer/$glb_id/destination"
