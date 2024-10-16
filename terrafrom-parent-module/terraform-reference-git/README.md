# reference-git module 0.0.3

Allows to use **`github.com/aleatoricmbnt/terraform-flat-module`** as a referenced module.

## Current version code

**`main.tf`**

```
  module "flat_from_repo" {
    source = "git::https://github.com/aleatoricmbnt/terraform-flat-module.git"
  }
```