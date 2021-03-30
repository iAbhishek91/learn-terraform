# Workspace

Terraform allows us to have different workspace, and each workspaces have different sets of environment variables.

For example we can have we have two workspace, prod and staging. Now, we can configure instance_type for staging environment as "t2.micro", and for production as "m4.large".

Its simple, create multiple workspace, and configure variables based on workspace(terraform.variable) using functions like map etc.

> NOTE: terraform.tfstate.d directory(contains directory for each instance) will be created, while using workspace. However for default the terraform.tfstate is created on the root directory.

Refer: XX-tf-workspace

>NOTE: All backend do not support workspaces, but most of them does like S3, GCS, Local, Remote, Kubernetes, etc.

current workspace is stored in .terraform/environment
