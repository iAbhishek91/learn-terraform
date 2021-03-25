# Terraform

- Terraform is from hashicorp.
- Terraform helps in infrastructure as code.
  - Terraform works with IaaS, PaaS, SaaS.
  - Terraform is used to provision, manage and update  infrastructure (physical VMs, network switches, container).
- Terraform under the hood uses APIs provided by cloud providers to achieve all these. All major cloud provider provides APIs to deal with Terraform. Terraform basically provides a wrapper layer on top of API so that developer can concentrate only on the configurations rather the API.
  - Terraform does not work if the cloud provider do not provide the API to provision the infrastructure.
  - Since they deal with infrastructure, there are some locking mechanism, which prevents terraform to simultaneously update the same resource. These are called state locking.
  - .terraform.tfstate.lock.info the lock file are saved here while there is any transaction.
  - State locking can be applied is backend supports it. For every write action terraform creates a lock so that other actions are not able to access the same resource simultaneously.
  - There is a mechanism of force unlock which allows forcefully acquire the resource. Be careful with this command.
- Hashicorp do not promote yaml, instead uses Their own configuration language.

## Terms with terraform

- **Resources**: they are vms, physical device on cloud which can be managed via API.
- **Providers**: refers to cloud provider. Providers are responsible for understanding API and underlying hardware.
  - Hashicorp maintained: there are providers that are maintained by hashicorp, few that are not maintained by hashicorp like digitalocean/digitalocean.
  - What is the difference?? - from 0.13 onwards, the below section(source information for providers) is required for non-hashicorp maintained providers. For hashicorp maintained provider the block is optional, however recommended. *This is because, by default terraform will search under hashicorp/<provider-name> hence digitalocean would not work*.

```hcl
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

terraform {
  required_providers {
    digitalocean = {
      source = "hashicorp/aws"
    }
  }
}
```

- **Module**: they are group of resources that are used together.
- **State**: it’s the state of the managed resources. They are saved by terraform in local or remote filesystem file called terraform.tfstate. it’s important for disaster for Terraform to work with our state.
- **Configuration files**: 
