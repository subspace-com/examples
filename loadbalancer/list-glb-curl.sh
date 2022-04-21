#!/bin/sh

token=${token:-`token`}

set -e

path="?limit=500&before="
[ -n "$1" ] && path="/$1"

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  "https://api.subspace.com:443/v1/loadbalancer/"
