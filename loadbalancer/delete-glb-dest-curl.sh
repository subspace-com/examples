#!/bin/sh

token=${token:-`token`}

read -r -d '' data <<EOF
{
    "destination_group_id": "$glb_group_id",
}
EOF

set -e

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  -d "$data" \
  -X DELETE \
  "https://api.subspace.com:443/v1/loadbalancer/$glb_id/destination/129.203.110.1/32261"