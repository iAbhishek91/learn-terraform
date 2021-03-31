# Local backend

This is an enhance backend, where we can save and execute the terraform

Locking of terraform.tfstate is done on local using system API.

By default, backend is configured to local, if nothing is mentioned. 

By default, the state file is saved in the current directly where, however we can change that by the below command

```hcl
terraform {
    backend "local" {
        path = "path/to/file"
    }
}
```
