# Variable

Variables file serve the same purpose like helm - values file(each values file is dedicated for a environment).

If we have multiple environment, we can have common terraform script to server the all.

> Refer: xx-multiple-variables-files

```sh
tf plan --var-file=prod.tfvars
```
