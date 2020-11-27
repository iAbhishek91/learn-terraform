# State file

ITS THE HEART OF THE TERRAFORM, and without this file terraform do not work.

*HENCE understanding **STATE FILE** is very important*

## Where its saved by default

Its created on the same folder where we are running our terraform.

file name is **terraform.tfstate** and **terraform.tfstate.backup**.

*Terraform itself takes backup of the file, it indicates the importance of this file.*

## Contents

Available in JSON format. *To the see the changes, open this file while performing **apply** and **destroy***

- Version: 4
- Terraform_version: 0.13.5
- details of the resources *if there are any created by terraform*

## About

- State file **keep track of all the changes** that we make.
- This file is referenced when we **Create**, **Delete** or **Update** resources.

## Horror scenario :(

For one resource there is no problem, if the file goes missing we can go to AWS and delete the resource manually. But think of a scenario where we have entire environment setup using terraform and the state file is missing.
