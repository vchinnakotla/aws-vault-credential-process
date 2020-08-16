#!/bin/bash
profile=$1
aws-vault exec $profile -- env | grep AWS > temp

AccessKeyId=`cat temp | grep AWS_ACCESS_KEY_ID | cut -d= -f2`
SecretAccessKey=`cat temp | grep AWS_SECRET_ACCESS_KEY | cut -d= -f2`
SessionToken=`cat temp | grep AWS_SESSION_TOKEN | cut -d= -f2`
Expiration=`cat temp | grep AWS_SESSION_EXPIRATION | cut -d= -f2`

echo "{
  \"Version\": 1,
  \"AccessKeyId\": \"$AccessKeyId\",
  \"SecretAccessKey\": \"$SecretAccessKey\",
  \"SessionToken\": \"$SessionToken\",
  \"Expiration\": \"$Expiration\"
}"
rm temp