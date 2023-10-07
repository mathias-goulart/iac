### Initial Release

Installs and configure the Datadog Agent with the provided key.
Use the `--key` option or provide the AWS credentials to boto3:

https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html

It should have access to the secret `/datadog/agent` in Secrets Manager.