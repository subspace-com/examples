#!/bin/sh

token=${token:-`token`}

set -e

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  -X GET \
  "https://api.subspace.com:443/v1/loadbalancer/$glb_id"
