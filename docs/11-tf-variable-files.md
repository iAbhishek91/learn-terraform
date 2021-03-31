# Variable

**This is one option to provide values to variables**, check tf-variables.md

Variables file serve the same purpose like helm - values file(each values file is dedicated for a environment).

If we have multiple environment, we can have common terraform script to server the all.

> Refer: xx-multiple-variables-files

```sh
tf plan --var-file=prod.tfvars
```

>NOTE: few files are auto loaded in terraform: terraform.tfvars, terraform.tfvars.json, *.auto.tfvars, *.auto.tfvars.json
