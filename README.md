## Sourcing credentials for aws cli with an external process aws-vault
## This repo contains an example of how to setup your config file
credentials.sh script generates a JSON output as below syntax supported by aws cli
```
{
  "Version": 1,
  "AccessKeyId": "an AWS access key",
  "SecretAccessKey": "your AWS secret access key",
  "SessionToken": "the AWS session token for temporary credentials", 
  "Expiration": "ISO8601 timestamp when the credentials expire"
}  
```

e.g aws s3 ls --profile foo-dev

# tested with
aws-cli v2.0.28
aws-vault v6.0.0