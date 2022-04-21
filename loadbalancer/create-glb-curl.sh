#!/bin/sh

token=${token:-`token`}

read -r -d '' data <<EOF
{
  "name": "my_first_glb",
  "subspace_port": 80,
  "destination_groups": [
    {
      "name": "US_WEST_NORTH",
      "destinations": [
        {
        "name": "SEA01",
        "ip": "129.203.110.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "PDX01",
        "ip": "129.203.98.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
    {
      "name": "US_WEST_SOUTH",
      "destinations": [
        {
        "name": "LAX01",
        "ip": "129.203.119.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "SAN01",
        "ip": "129.203.55.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
    {
      "name": "US_EAST_NORTH",
      "destinations": [
        {
        "name": "BOS01",
        "ip": "129.203.53.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "EWR01",
        "ip": "129.203.114.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
    {
      "name": "US_EAST_SOUTH",
      "destinations": [
        {
        "name": "ATL01",
        "ip": "129.203.118.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "MIA01",
        "ip": "129.203.104.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
    {
      "name": "US_CENTRAL_NORTH",
      "destinations": [
        {
        "name": "DEN01",
        "ip": "129.203.106.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "MCI01",
        "ip": "129.203.124.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
    {
      "name": "US_CENTRAL_SOUTH",
      "destinations": [
        {
        "name": "PHX01",
        "ip": "129.203.113.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
        {
        "name": "LAS01",
        "ip": "129.203.44.1",
        "port": 32261,
        "enabled": "ENABLED"
        },
      ]
    },
  ]
}
EOF

set -e

curl \
  -vv \
  --user-agent "integration-test" \
  -H "Authorization: Bearer $token" \
  -d "$data" \
  "https://api.subspace.com:443/v1/loadbalancer"
