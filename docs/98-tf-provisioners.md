# Provisioners

Provisioner are used to execute scripts  on the local machine or on remote machine in order to prepare servers or other infra objects.

NOTE: Provisioners are last resort.

**WHY PROVISIONERS EXISTS?**

They exists as terraform cant map all behavior in its declarative model.

These behavior adds considerable amount of complexity and uncertainty to Terraform usage. WHY? Because of two reason:

- They can be mapped with Terraform declarative model, as they can in principle take any action.
- even if you use provisioners, it requires coordination of many more details than terraform usage usually requires.

Its suggested not to use provisioners in most of the scenarios. There are other better solution available.

## How do you configure the system those are created via terraform

Most like Ansible or chef.

## Type of provisioners

Terraform keeps on adding provisioners on the system.

- local-exec: it execute on the local machine where the tf apply is done. For example you need to save the ip_address of all the ec2 instance in your local system OR advance you can execute ansible playbooks.
- remote-exec: it will execute on the remote machine.
- chef
- file
- habitat
- null-resource
- salt-masterless
