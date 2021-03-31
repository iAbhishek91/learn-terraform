# AWS STS

This is one of the extensions of tf provider configurations. Refer xx-tf-providers.md

We have already discussed about the **"multiple account"** scenario in the referred file.

Now, generally in most of the organization multiple accounts are manges in different way. Instead of creating multiple accounts with user-name and token, organizations creates a single **Identity account, which will have single set of username and password, access and secret keys**.

Then that single set of account uses assume roles(refer STS) to connect with all the other accounts. To achieve the same thing from terraform we need to do certain configuration in the providers

```hcl
provider "aws" {
    region = "eu-west-2"
    assume_role {
        role_arn = "arn:aws:iam:67883456q3477:role/abhishek-sts"
        session_name = "sts-demo"
    }
}
```

## How exactly assume role works

- assume role, is created on the target account where you want get through.
- to assume the role from a different account, your AWS account must be trusted by the role. Trust policy is created when the role is created. trust policy states which accounts are allowed to delegate that access to users in the account.
- returns temporary credentials(access key id, secret access key, security token), can be able to access within one account or cross-account access.
- Temporary security credentials created by assume-role last for one hour, bu can be increased by DurationSeconds parameter.