# Modules

Modules are just folder with code in it. How they are used in Terraform?

This is mainly for structuring terraform project, as only **main.tf** will be confusing and difficult to read and maintain. With modules we an implement DRY principle *in SE Don't Repeat Yourself, is a principle of software development aimed at reducing repetition of software patterns*.

Also we can keep **terraform code as template** and pass everything from the `main.tf`.

Visualize modules as *functions in traditional programming language it takes some arguments(input variables) and have a return values(output variables)*

> NOTE: during init phase modules are initialized.

Modules can be **external(third party) or user defined**.

> VERY IMP: When we are working with modules, when we modify anything in the module, we need to run `tf init` EACH TIME.

**Output** are important in modules as we need to pull down some of the values of *resources and attributes* form the modules. This more important when we deal with third party modules.

## Source of modules

There are different type of source that are supported by terraform:

- Local paths

```hcl
module "consule" {
    source = "/path/to/module"
}
```

- Terraform registry

```hcl

```

- GitHub

```hcl
    source = "github.com/hashicorp/example"
    source = "github.com/hashicorp/example?ref=development" // ref can be tag, branch or any other commit (ref specs)
```

- BitBucket

```hcl
    source = "bitbucket.org/hashicorp/terraform-consul-aws"
```

- Generic Git, Mercurial repositories

```hcl
    source = "git::<http or ssh urls>"
```

- HTTP URLs
- S3 buckets

```hcl
    source = "s3::https://s3-eu-west-1.amazonaws.com/examplecorp-terraform-modules/vpc.zip"
```

- GCS buckets

```hcl
    source = "gcs::https://www.googleapis.com/storage/v1/modules/foomodules.zip"
```

## Terraform registry

Terraform registry: https://registry.terraform.io/

We can find terraform **modules** and **providers** which are hosted by Hashicorp or open source developer.
