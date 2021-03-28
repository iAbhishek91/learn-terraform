# Good to know

## Access to cloud resources

This is not a constraints, but this is not possible, if you are thinking about infrastructure automation.

- Terraform can create resources that are defined in the project.
- Terraform can **delete only resource that it have created**. The information of the resources created by terraform are stored in *state file*.

> New feature import mitigate this. Check out xx-import

## terraform script maintenance

Terraform scripts require high maintenance. However they are generally well documented.

- version of terraform: includes - hcl, config changes, 
- version of API you are using

## Challenges with large infrastructure

refer xx-large-infrastructure.md

## Desired and current state

for example updating security group from default to custom: this is important to understand that **desired state is only part that we mention explicitly, and not the default values**. Hence if we have manually changed the default to custom from AWS console, the desired state do not mention the security group. Hence if we `tf plan` this will just update state file and not change the security group back to default. **Its always suggested that we mention explicitly all the attribute we want, and not to depend on default(optional) values**.

## Provider version

It is important to note that **terraform's release are different from provider version and most importantly they have different release cycle**. This is good but it has its own set of challenges. Hence, its very important mainly in production system to set the provider plugin versions. If NOT mentioned, most recent version of plugin will be used as part of `tf init`.

```hcl
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
            // below are the version arguments allowed
            // =1.0 - equal to 1.0 // this is recommended
            // >=1.0 - greater than equal to the version
            // <=1.0 - less than equal to the version
            // ~>2.0 - any version in the 2.X range
            // >=2.10,<=2.30 - any version between 2.10 and 2.30
        }
    }
}
```
