# Local values

It assigns a name to an expression, allowing it to be used multiple times within a module without repeating it.

Local values supports expressions and functions etc

excessive use of **local** creates confusion and diminishes readability, however mostly used in expression which are like to change in future. Use cases, like

- tags
- attributes, which have some common validation via expressions.

BEST PRACTICE: Try to groups locals that are related if they are dependent on each other.

>NOTE: self and circular reference are not allowed, means a local cant refer to itself or any other var which points to this.

- c = local.c // self reference

- a = local.b // cyclic reference
- b = local.a
