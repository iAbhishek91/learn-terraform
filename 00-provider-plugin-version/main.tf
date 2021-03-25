terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

// If we change the version, with out delting the lock file `tf init` may thorow errors.
// this is because of imcompatibility.
// To avoid this we can delete the lock file or issue `tf init -upgrade`