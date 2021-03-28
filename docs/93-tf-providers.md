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
