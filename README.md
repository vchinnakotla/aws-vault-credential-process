## Sourcing credentials for aws cli with an external process aws-vault
### This repo contains a bash script and an example of how to setup your config file
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

### an example of your aws config
```
[profile foo]
credential_process = /home/user/aws-vault-credential-process/credentials.sh foo parameterWithoutSpaces "parameter with spaces"
mfa_serial=arn:aws:iam::1234567890:mfa/foo@bar.com

[profile foo-dev]
source_profile=foo
role_arn=arn:aws:iam::0987654321:role/administrator
mfa_serial=arn:aws:iam::1234567890:mfa/foo@bar.com
```

e.g aws s3 ls --profile foo-dev

### tested with
[aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html Installing the AWS CLI) v2.0.28
[aws-vault](https://github.com/99designs/aws-vault AWS Vault is a tool to securely store and access AWS credentials in a development environment) v6.0.0