# Commands

## INIT

```sh
terraform init
# it download the plugins required and initializes tf
```

## PLAN

**plan** is executed as part of apply and destroy

```sh
tf plan
# output: (PERSONAL NOTE: the color will be GREEN as we are creating the resource. Also all the **known after apply** are optional field which terraform will discover after its been apply, rest all are mandatory for example: cidr_block)
#+ resource "aws_vpc" "myvpc" {
#      + arn                              = (known after apply)
#      + assign_generated_ipv6_cidr_block = false
#      + cidr_block                       = "10.0.0.0/16"
#      + default_network_acl_id           = (known after apply)
#      + default_route_table_id           = (known after apply)
#      + default_security_group_id        = (known after apply)
#      + dhcp_options_id                  = (known after apply)
#      + enable_classiclink               = (known after apply)
#      + enable_classiclink_dns_support   = (known after apply)
#      + enable_dns_hostnames             = (known after apply)
#      + enable_dns_support               = true
#      + id                               = (known after apply)
#      + instance_tenancy                 = "default"
#      + ipv6_association_id              = (known after apply)
#      + ipv6_cidr_block                  = (known after apply)
#      + main_route_table_id              = (known after apply)
#      + owner_id                         = (known after apply)
#    }
```

- checks the state, to verify what is already created and whats not. it creates a .terraform folder. Its difficult if we loose that file.
- refer *0x-tf-save-state-file.md* to know more how to store state file safe and secure.

## APPLY

```sh
# apply the resource in the provider. it will also check everything using the PLAN and ask for confirmation by default
tf apply
# Output
# aws_vpc.myvpc: Creating...
# aws_vpc.myvpc: Creation complete after 1s [id=vpc-0c2e52f678cdce96e]
# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## DESTROY

```sh
tf destroy
# Output: (PERSONAL NOTE: the color will be RED as we are destroying the resources. Also all the **known after apply** are now fields which terraform will discover after its been apply are filled.)
# aws_vpc.myvpc will be destroyed
#  - resource "aws_vpc" "myvpc" {
#      - arn                              = "arn:aws:ec2:eu-west-2:611637807043:vpc/vpc-0c2e52f678cdce96e" -> null
#      - assign_generated_ipv6_cidr_block = false -> null
#      - cidr_block                       = "10.0.0.0/16" -> null
#      - default_network_acl_id           = "acl-0ad3046c57c78ac45" -> null
#      - default_route_table_id           = "rtb-0ff1fd87a0f5806d6" -> null
#      - default_security_group_id        = "sg-00889dc28c05ae675" -> null
#      - dhcp_options_id                  = "dopt-2764344f" -> null
#      - enable_dns_hostnames             = false -> null
#      - enable_dns_support               = true -> null
#      - id                               = "vpc-0c2e52f678cdce96e" -> null
#      - instance_tenancy                 = "default" -> null
#      - main_route_table_id              = "rtb-0ff1fd87a0f5806d6" -> null
#      - owner_id                         = "611637807043" -> null
#      - tags                             = {} -> null
#    }
```