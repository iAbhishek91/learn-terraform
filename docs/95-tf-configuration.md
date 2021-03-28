# Terraform configuration

- This will help you to configure some behavior of the Terraform it self.
- Terraform block CANT have any thing apart from constants, (no variable, input vars, named objects)

For example: requiring a minimum terraform version

Terraform settings are gathered into terraform block, however NOTE, this you can have multiple terraform blocks(one defining backend, another providers)

```hcl
terraform {
    required_version = "> 0.12.0"
    required_providers {
        anycloud = {
            source = "anyorg/anycloud"
            version = "~> 1.0"
            // below are the version arguments allowed
            // =1.0 - equal to 1.0 // this is recommended
            // >=1.0 - greater than equal to the version
            // <=1.0 - less than equal to the version
            // ~>2.0 - any version in the 2.X range
            // >=2.10,<=2.30 - any version between 2.10 and 2.30
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

There are two areas of terraform behavior that are determined by backend

- where state is stored?
- where operations are performed?

- Backend types are to be mentioned, for example above "s3".
  - There are may different types of backend type available(new backend types cant be added by users), however mainly classified as:
    - standard backend types:
    - enhanced backend types
- In case backend block is not explicitly mentioned, "local" is configured as backend while `tf init`
- hence backend configuration requires `tf init`

## experiment feature

- this are features that can be enabled explicitly by mentioning in the configuration.
- this experiment values are mentioned [here](https://github.com/hashicorp/terraform/blob/main/CHANGELOG.md) and can be configured as mentioned above.
