# Functions

Built-in functions can be used to call within expressions to transform and combine values.

SYNTAX: **function_name(arg1, arg2...)**

NOTE: There is not user defined function supported.

Test a function from terraform console

```sh
# provides with terraform console
tf console
> sum([1,2,3,4,5])
15
> file('${path.module}/id_rsa.pub')
20
```

## Function classifications or categorization

- Numeric
- String
- Collection
- Encoding
- Filesystem
- Hash and Crypto
- IP Network
- Type Conversion

refer: https://www.terraform.io/docs/language/functions/index.html
