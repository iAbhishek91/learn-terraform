# Modules

Modules are just folder with code in it. How they are used in Terraform?

This is mainly for structuring terraform project, as only **main.tf** will be confusing and difficult to read and maintain.

Also we can keep **terraform code as template** and pass everything from the `main.tf`.

> NOTE: during init phase modules are initialized.

Modules can be **external(third party) or user defined**.

> VERY IMP: When we are working with modules, when we modify anything in the module, we need to run `tf init` EACH TIME.

**Output** are important in modules as we need to pull down some of the values of *resources and attributes* form the modules. This more important when we deal with third party modules.

## Terraform registry

Terraform registry: https://registry.terraform.io/

We can find terraform **modules** and **providers** which are hosted by Hashicorp or open source developer.
