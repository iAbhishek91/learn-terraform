# Terraform configuration

This will help you to configure some behavior of the Terraform it self.

For example: requiring a minimum terraform version

Terraform settings are gathered into terraform block

```hcl
terraform {
    required_version = "> 0.12.0"
    required_providers {
        anycloud = {
            source = "anyorg/anycloud"
            version = "~> 1.0"
        }
    }
}
```
