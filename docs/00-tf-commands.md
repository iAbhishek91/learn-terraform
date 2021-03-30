# Commands

## INIT

```sh
terraform init
# this command also initialize the backend
# it download the plugins required and initializes tf
# this command is idempotent
# this is first command you run when you write configuration file, update or clone from somewhere.

terraform init -lock=false

# to upgrade the provider plugin version when lock file exits
# this command will update the lock file as well
terraform init -upgrade
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

# pass a variable files.
tf plan --var-file=prod.tfvars

# save the terraform plan to a file
# note the file will NOT be human readable
# for exam we need to know, not used in real time
tf plan -out=tfplan
# output
# This plan was saved to: tfplan
# perform exactly these actions, run the following command to apply
#   terraform apply "tfplan"


# stop performing update of all the resources will not happen
# this is used for large project as it may hit the API limits
tf plan -refresh=false


# to minimize the API call, we can also restrict plan for target resource, instead of *
# this is also for the same purpose as previous one
tf plan -target=ec2
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

# will not ask for confirmation
tf apply -auto-approve

# with var files
tf apply -var-files=prod.tfvars
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

# to destroy specific resource, not everything
# -target is used for focusing terraform attention on only subset of resources
# combination of Resource Type + Local Resource Name (ResourceType.LocalResourceName)
tf destroy -target aws_instance.myec2 # deletes only myec2 aws ec2 instance
```

## IMPORT

```sh
# refer 99-challenges/xx-import-ec2 for the steps required
tf import aws_vpc.myvpc2 vpc-05372a0768b93f530
```

## Other commands

### FMT

```sh
# this command applies canonical format and style as well as
# terraform language style convention
terraform fmt
```

### VALIDATE

```sh
# validate the config files in a directory(this is not required as tf plan executes this under the hood)
# this command only validate configuration and no remote services - state or provider API
# this command validates configurations in a directory, syntax, attribute names and value types, unsupported arguments, undeclared variables and others
# validate works only post init
tf validate
```

### CONSOLE

```sh
# provides an interactive console for evaluating expression
# NOTE: state file is fetched(local or remote) when this command is executed
$ echo "1 + 5" | terraform console
## OUTPUT
# 6
```

### FORCE_UNLOCK

```sh
# acquire the lock forcefully.
terraform force-unlock LOCK_ID

# no manual intervention
terraform force-unlock LOCK_ID -force
```

### GET

```sh
# used to download or update the module mention in root module
terraform get
terraform get -update
```

### STATE

```sh
# to update the state file, for more details: XX-tf-state-update.md

# list resources from state file(tf apply on 09-state-management)
tf state list
# OUTPUT
# aws_iam_user.name
# aws_vpc.myvpc

# show the attributes oa a single resources in the state 
tf state show aws_iam_user.tf_user
# OUTPUT
# aws_iam_user.tf_user:
# resource "aws_iam_user" "tf_user" {
#    arn           = "arn:aws:iam::191546957099:user/system/terrafrom"
#    force_destroy = false
#    id            = "terrafrom"
#    name          = "terrafrom"
#    path          = "/system/"
#    unique_id     = "AIDASZGIWTUVYHOE3SBUI"
#}

# remove items from the state file
tf state rm aws_iam_user.tf_user

# move item from terraform state file
# this will change the local name of the object in the state file.
# to make the change in sync, also change the configuration similar to new/update name
tf state mv aws_iam_user.name aws_iam_user.tf_user

# manually download and output the state from remote state, by default it will display in std out, if required redirect it to another file.
tf state pull
tf state pull > terraform.tfstate

# manually upload local state file to remote state
tf state push
```

### GRAPH and SHOW

```sh
# generate a visual representation of either a config or execution plan
# output: DOT format, which can be easily converted into image
tf graph

# Show: provide human readable output from a state or plan file.
# output: JSON format,
tf show 

tf show planfile

```

### TAINT and UNTAINT

```sh
# marks resources, to be destroyed and recreated on next apply
# taint command will not perform any change to resource, but on the state file
# below command will taint everything
terraform taint

# The resource aws_security_group.allow_all in the module root has been marked as tainted.
$ terraform taint aws_security_group.allow_all

#The resource module.route_tables.azurerm_route_table.rt["DefaultSubnet"] in the module root has been marked as tainted.
terraform taint 'module.route_tables.azurerm_route_table.rt["DefaultSubnet"]'

# Untaint have same syntax as taint
terraform untaint
```

### REFRESH

```sh
# this will run a reconcile between actual infrastructure and state file
# if discrepancies are found, then state file will be updated.
terraform refresh

terraform refresh -var-file=prod.tfvars
```

### OUTPUT

We can use `tf apply` to fetch the output values at later stage, instead of tf output. tf output provides a alternative to the same

```sh
# extract output values from state file
output "lb_address" {
  value = aws_alb.web.public_dns
}

# below command will print all the values from the state file
tf output

# specific output value
tf output lb_address
```

### PROVIDER

```sh
# shows information about the provider requirement of the configuration in the current working directory
tf providers
```

### LOGIN

```sh
tf login
#will basically request an API token for the backend mentioned from the browser. If login is successful, Terraform will store  the token in plain text in the following file for use by subsequent commands.

#C:\Users\abhishek\AppData\Roaming\terraform.d\credentials.tfrc.json

#Terraform must now open a web browser to the tokens page for app.terraform.io.

#If a browser does nto open this automatically, open the following URL to proceed:
# https://app.terraform.io/app/settings/token?source=terraform-login

# Generate a token using your browser, and copy-paste it into this prompt.

# Terraform will store the token in plain text in the following file for use by subsequent commands:
# C:\User\Abhishek\Roaming\terraform.d\credentials.tfrc.json

# Token for app.terraform.io: note when you paste nothing will be displayed

# Retrieved token for user abhishek

# Success! Terraform has obtained and save and API token.

# The new aPI token will be used for any future terraform command that must make authenticated requests to app.terraform.io
```

## WORKSPACE

```sh
# show all the sub commands
tf workspace -h

# displays the current workspace
tf workspace show

# list all the workspace, and also the current one in use
tf workspace list

# create a new workspace
tf workspace new my-workspace

# delete a workspace
tf workspace delete my-workspace

# select workspace
tf workspace select my-workspace
```
