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
