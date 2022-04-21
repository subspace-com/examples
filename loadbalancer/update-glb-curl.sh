#!/bin/sh

token=${token:-`token`}

read -r -d '' data <<EOF
{
  "name": "new_name"
}
EOF

set -e

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  -d "$data" \
  -X PUT \
  "https://api.subspace.com:443/v1/loadbalancer/$glb_id"
