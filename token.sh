#!/bin/sh

read -r -d '' data <<EOF
{
  "client_id": "$AUTH0_CLIENT_ID",
  "client_secret": "$AUTH0_CLIENT_SECRET",
  "audience": "$AUTH0_AUDIENCE",
  "grant_type": "client_credentials"
}
EOF

curl --request POST \
     --url "$AUTH0_URL/oauth/token" \
     --header 'content-type: application/json' \
     --data "$data" \
    | jq -r .access_token
