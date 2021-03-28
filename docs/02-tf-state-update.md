# Update of statefile

Its scenario, mainly when dealing with large/advance infrastructure, we sometime need to edit the statefile.

However, NEVER update state file directly instead use `tf state` command.

## List

We can list all the resources that are applied.

## Show

See the arguments that were passed for specific resource from state file.

## Move

Used for moving items in a terraform state.

Mainly where you want to rename(name is local to terraform, and nothing to do with the cloud resource) an existing resource without destroying and recreating it *mv in unix for renaming a file*.

> NOTE: if we directly change the name in the configuration it will delete the exiting resource and create a new one, which is NOT, what we want. *try changing the iam_user name from name to tf-user, execute plan(there will be one addition and one destruction, then execute tf state mv, now execute tf plan, notice that there is no change.)*.

Due to this destructive nature of this command, automatically a backup copy of the state file before applying the change.

## Pull

To pull remote state to local we mostly use pull. Mostly to verify what is there in the remote state file, instead of navigating to cloud console.

### Push

Is reverse of pull, its rarely used and is note recommended.

mostly used when we migrate from local backend to remote backend.

## rm

This removes the items from state file. NOTE: it do not physically destroy the actual resource, and hence resources removed from state file will no longer managed by AWS.

This comes handy, when you really want to delete one of the resource from terraform, which is already deleted from cloud resource, without disturbing anything. Also remember to remove the configuration from the tf files.
