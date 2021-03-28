# Certification exam

## what are external dependencies of terraform

Terraform can have two different kinds of external dependencies that come from outside of its own codebase:

- **Providers** (which are plugins for terraform that extend external system)
- **Modules** (which allow splitting out groups of Terraform configuration constructs(written into hcl) into reusable abstraction)

Both these dependencies types can be published and updated independently from terraform itself. Hence lock file was introduced to maintain the versions. *Note: currently only provider version is stored in lock file and nothing about the modules. Modules are always latest that meets the specified version constraints*

## What is the way to safely store the credential

- AWS CLI
- Vault provider
- environment variable

## How do you store passwords or sensitive data in terraform

- secret injection are not recommended as state file will contain the value.
??

## How to update the infrastructure that are already deployed

`tf apply` take care of automatically, just make sure state file is safe.

In other words we are trying to update the *Current state*(which is actually deployed), to a new *Expected state*(which is to be updated).

Step-1: update the terraform configuration files, which the desired state.
Step-2: `Terraform plan` will highlight the changes that will be done to achieve the desired change.
Step-3: `Terraform apply`

## what are the challenges/complexity with terraform

refer 03-tf-constraints.md

## How to update the state file if resources have changed via different methods

`tf refresh` or `tf plan` will also execute `tf refresh` under the hood.

Note: if update of resource is not possible, terraform will delete the exiting resource and create a new one. It solely depends on resource and its attributes changed.

## How do we update terraform version which is already running

Best way to do is go through the document for upgrade. Terraform version upgrade includes "configuration language upgrade", "cli", "internal terraform back-ends", "providers"

Also terraform comes with upgrade command "terraform 0.12upgrade" which will update all the configuration file with in the current directory. This is a new command that is introduced. Terraform also comes with "terraform 0.12checklist" command to check if there are any pre-requisite steps involved.

Before running

- "terraform init" is required so that terraform can download the compatible providers.
- "terraform apply" this ensures that real infra and state file are synchronized.

Also mostly we have seen its better to upgrade one version at a time. So if you want to upgrade to 0.10 to 0.12 first migrate to 0.11 then to 0.12.

## What is the use of .terraform.lock.hcl

This is new feature in 0.14.

This file is created while `tf init`. Is used to lock the version of provider plugin downloaded. Very similar to package-lock.yaml file.

Lock file should be preserved.

If we want to update the version which is used, either delete the lock file or give `tf init -upgrade` command. Note: upgrade will still validate the constraints and may then select a newer version for a provider and update its existing provider.

Lock file also saves the checksum of the provider plugin, and will verify at least one of the checksums previously recorded in the lock file. If do not match it will throw error.

## What are way to lock the state file

State file is locked by default, so that no-one can acquire the lock while terraform apply is in process.

There are many way to do that

```sh
# disable lock while initializing, like this most of the command accept this flag
terraform init -lock=false

# forcefully remove the lock 
terraform force-unlock LOCK_ID
```

## What is terraformrc file

"terraform.rc" - in WINDOWS in user %APPDATA% or ".terraformrc" all OTHERS OS in home directory: is a CLI configuration file which configures per user settings for CLI behaviors across all terraform working directories.

Read option available in docs "terrafrorm cli-configs".

## What happens if terraform cant model certain behavior

Use of Provisioners. Refer **XX-provisioners**

## How terraform discover plugins

Plugin discovery is done via "tf init" command. It scans all the configuration files and identify all the plugins required to be downloaded. If required terraform downloads additional plugin as well. The plugin version its using is saved in the lock file and ensuring tha terraform will use the same plugin version in future.

## What are the different behavior of terraform plugins during discovery OR what are the different type of plugins available?

- built-in
- providers
- provisioners

## How do we rollback in terraform

Version control the terraform configuration file, and if you want to rollback, move back to previous version of commit.

It is essential to ensure that the old code contains all the entities provisioned in teh code for rollback.

If the state file has been subject to corruption from a recent Terraform run, then you can opt **State Rollback Feature** in Terraform Enterprise. (this will help you to rollback to the previous latest state)

## How to lock the version of modules you are using

Terraform do not have a default way to lock the version modules. Hence use "version constraints". **Version Constraints** allow you to specify a range of acceptable versions of something.

Version constraints expects a specially formatted(string literal containing one or more condition) string known as a version constraint.

Version constraints are used when configuring: Module, Plugins.

syntax is very similar to NPM `version = ">= 1.2.0, < 2.0.0"` (it is placed in terraform configuration file under module)

NOTE: if terraform do not find any acceptable versions of external dependencies, then plan, apply or any modification to state file would not progress.

Version constrains can be applied on both root and child modules. There is no precedence, all the constraints are considered by terraform.

Best practices:

- when we use third party modules
- also best for large organization developing internal modules.

## How do you handle resources that are manually updated

There are many scenarios where resources are manually updated after getting created from Terraform or before. There are basically **three options** you have:

- tf refresh: if the resource was created and got updated
- tf import: resources that were not created by terraform, and manually created.
- manual process: delete all the resources and update the tf configuration files and apply. Tf have mechanism for manual steps as well like taint which will destroy and recreate the resources.
