# Providers

Provider as we know are plugins, that allow us to communicate with various cloud and data sources.

In this docs we speak about various options of configuring providers. Below are some of the use cases

- Multi region
- Multi account

## Multi region

Multiple configuration are not allowed for a single provider, however this can be achieved by providing **"alias"** for each of the providers.

If alias is not defined for provider, that becomes a **default provider configuration**n which will be allocated to all resource and modules where provider is not explicitly mentioned.

NOTE: They are valid only on **resources**, **modules**, and **outputs**.

```hcl
// for resource
resource resource_type "name" {
    provider = aws.mumbai
}

// for modules
// this is important to note, in most case,
// only parent(root) module gets its provider configuration
// all child modules gets in provider configurations from parent module.
// below providers, determines, which provider configuration will be passed to child modules.
// if the below is not mentioned then default configuration is passed.
module "name" {
    source = "./mymodule"
    providers = {
        aws = aws.london
    }
}
```

refer - 99-challenges/XX-multi-region, this will help you to deploy resources across different.

## Multi Account

> We don't have multiple account, hence we are not demonstrating this scenario.

For Multi account, think that we have multiple account with different user_name and password.

As in AWS CLI (we need to create a **.aws** directory where all the **credentials** are stored, which is used by the AWS CLI).

```txt
[default]
aws_access_key_id = bla bla
aws_secret_access_key = bla bla

[account2]
aws_access_key_id = bla bla
aws_secret_Access_key = bla bla
```

to mention the which profile to use we can mention that in the provider configurations.

```hcl
provider "aws" {
    region = "eu-west-2"
    alias = "london"
    profile = "account2" // this account will make sure that the resources are deployed in the specific account.
}
```
