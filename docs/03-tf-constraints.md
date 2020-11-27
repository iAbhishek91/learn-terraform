# Good to know

## Access to cloud resources

This is not a constraints, but this is not possible, if you are thinking about infrastructure automation.

- Terraform can create resources that are defined in the project.
- Terraform can **delete only resource that it have created**. The information of the resources created by terraform are stored in *state file*.

> New feature import mitigate this. Check out xx-import

## terraform script maintenance

Terraform scripts require high maintenance.

- version of terraform
- version of API you are using
