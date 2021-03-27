# Terraform configuration

- This will help you to configure some behavior of the Terraform it self.
- Terraform block CANT have any thing apart from constants, (no variable, input vars, named objects)

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
    // backend as it goes inside terraform, it cant take ONLY constants
    backend "s3" {
        bucket  = "name-of-the-s3-bucket"
        key     = "terraform.tfstate"
        encrypt = true
        region  = "ap-south-1"
    }
    experiments = [example]
}
```

## backend

- Backend types are to be mentioned, for example above "s3".
- In case backend block is not explicitly mentioned, "local" is configured as backend while `tf init`
- hence backend configuration requires `tf init`

## experiment feature

- this are features that can be enabled explicitly by mentioning in the configuration.
- this experiment values are mentioned [here](https://github.com/hashicorp/terraform/blob/main/CHANGELOG.md) and can be configured as mentioned above.
