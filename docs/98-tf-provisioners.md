# Provisioners

Provisioner are used to execute scripts  on the local machine or on remote machine in order to prepare servers or other infra objects.

- There can be multiple provisioner section that can be defined.

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

- **local-exec**: it execute on the local machine where the tf apply is done. For example you need to save the ip_address of all the ec2 instance in your local system OR advance you can execute ansible playbooks.
- **remote-exec**: it will execute on the remote machine.
- **chef**
- **file**
- **habitat**
- **null-resource**
- **salt-masterless**

> NOTE Based on time of execution, provisioner are also classified into two type:

- **creation time provisioner**: they are executed only one during the creation, and never after. Also NOTE that creation time provision if fails the resource is marked as **tainted** and **tf apply** will also **FAIL**.
- **destroy time provisioner**: they are execute only before the resource is destroyed.

```hcl
resource "aws_instance" "myec2" {
    provisioner "local-exec" {
        // this when argument should be destroy and should NOT be under quotes
        // if the below is not provided then it becomes a creation time provisioners 
        when = destroy
        command = "echo 'destroy-time provisioner'"
    }
}
```

## Failure behavior

As mentioned before terraform apply will fail if provisioner fails. But this is a default behavior, we have option to override this

if value of on_failure is set to nothing (defaults to **fail**) then tf apply will fail else if on_failure is **continue** (NOT inside a quotes)then it will ignore the error and continue with creation or destruction.

resource "aws_instance" "web" {
    provisioner "local_exec" {
        command = "ls -al"
        on_failure = continue
    }
}

>NOTE: IMPORTANT, if terraform fails due to provisioners, then the resources are marked as tainted.
