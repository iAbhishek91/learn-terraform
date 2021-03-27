# Taint and Untaint

Terraform taint command manually marks a terraform-managed resource as tainted, forcing it to be destroyed and recreated on next apply.

refer the xx-tf-commands.md

NOTE: There are always dependencies between resources for example dns and ec2. So if we taint the ec2, the on next apply the IP address of the ec2 instance will be deleted and hence you need to take care of the dependencies manually.
