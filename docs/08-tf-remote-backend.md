# Remote backend

Remote backend are remote place where you can save your state files.

> NOTE: all backend in terraform are classified under two categories: as enhanced and standard. There are only two enhanced backend: local and remote, which can store state file as well as run terraform command.

This is useful when we are working with **multiple team members**.

Optionally we can also use **terraform cloud**.

Basically what it does is it keeps the file in a remote place. Generally **S3 or CloudStorage** is used. *We need to turnon versioning so that the changes are tracked along with lifecycle.*

Then we need to configure terraform to store the statefile to the remote place instead of local.

> Ref: xx-remote project

## First time configuration

When configuring a backend for the first time, i.e, moving from no defined backend to explicitly configuring one, terraform will give you the option to migrate your state to the new backend.

## Partial time configuration

Its not necessary to specify every required argument in the backend configuration, mainly due to security reason, can later mention that during initialization

`tf init \
    -backend-config="address=demo.consule.io"
    -backend-config="path=example"
    -backend-config="argument_name=argument value"`
