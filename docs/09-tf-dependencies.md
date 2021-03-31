# Dependencies

Dependencies are required to be mentioned when some resources are required to be created before another.

Terraform by default DO NOT respect the order of the .tf files. Hence we need to mention the dependencies explicitly.

>NOTE: if there are some reference of any resource on another, terraform will create a implicit dependencies.

**Syntax** : depends_on = [ aws_instance.db ]

**Common Usecases** : EIP after instance (mostly applied for operation that are requires more time)

> Ref xx-dependencies
