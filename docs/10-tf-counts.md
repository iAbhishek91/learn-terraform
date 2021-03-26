# Counts

Creating multiple resources. This is most easy and commonly used pattern to create duplicate resources.

> Ref: xx-count and xx-count-advance

count = 5 | length(var.list)
count.index *this is handy as some resource cant be created with same name, hence we can use count.index*
