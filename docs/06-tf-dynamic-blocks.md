# Dynamic blocks

This is a new feature introduced on 0.12.

Dynamic block are introduced to address the problem of **repeated nested block**. This are tedious an error prone if we try to use expression and some time not even possible.

A Dynamic block acts much like a for expression, but produces nested blocks instead of a complex typed value.

Dynamic blocks are allowed in **resource**, **data**, **provider**, and **provisioner** block.

## Cons of dynamic blocks

- Over use of dynamic blocks are not suggested, as it makes code unreadable.
- Its recommended to write literal block where ever possible.
- Use it only when we need to hide details for *in order to build a clean user interface for a re-usable module*.

> Refer 0x-dynamic-block project
