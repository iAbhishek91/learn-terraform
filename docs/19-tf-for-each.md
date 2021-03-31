# For Each

Its a meta-arg accepted by modules and resources.

For each takes a set or a map and iterates it over the block.

When we use for_each, each.key and each.value is created and is available for use. If set is used, the  value of key and values are same.

## Limitation of for-each

- sensitive data are not used against for_each. As for each values are displayed in the output.
- the values must be known values
- foreach keys cannot be the result of impure function uuid, bcrypt.
