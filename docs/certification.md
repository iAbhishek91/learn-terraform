# Hashicorp Certified Terraform Associate

- Duration: 1 hour
- Validity: 2 year
- Questions: 57
- Passing marks: not revealed
- Question types: true and false, multiple choice, fill in the blanks

## Important pointers

- Focus on **providers** and its capabilities (like use of alias, assume_role). Most of the providers corresponds to one cloud or on-premise infrastructure platform, and offers resource types. Version upgrade, and locking of providers are also important.
- **tf init**: looks for modules, else downloads it, looks for providers, downloads and installs it so that it can be executed, and will initialize the backend.
- **tf plan**: not modify anything, it will perform refresh, actions that are necessary to achieve the desired state, can save the plan to be later applied.
- **tf apply**: apply the changes required to reach the desired state of the configuration, also writes data to terraform.tfstate file. Also once apply is completed, the resource are available.
- **tf refresh**: it modify the state file based on the current infra, and no changes are made on the actual infra.
- **tf destroy**: destroys all terraform managed infra. another way to delete is to delete the config and perform tf apply.
- **tf fmt**: canonical format and style.
- **tf validate**: init is required, static check of syntax, correctness of attributes names and its value types.
- **tf import**: configuration are to be created prior to import, only updates state file.
- **Provisioners**: provisioners should be last resort, most of the case there are alternatives. provisioner are inside resource block, practice the syntax of the provisioners.
- **Debugging**: TF_LOG (TRACE, DEBUG, ERROR, WARN, INFO), TF_LOG_PATH
- **other environment variable**: TF_VAR_varname=value, TF_INPUT=0, TF_DATA_DIR (by default .terraform in current dir), TF_WORKSPACE=workspace, TF_CLI_CONFIG_FILE="/path/to/file"
- **locals**: name to a expression,cycles are not allowed means it cant refer itself, or create any other cycles, it is recommended to group together logically-related local values into a single block, particularly if they depend on each other.
- **data types**: need to read documents and practice
- **workspace**: workspace allows multiple state file under terraform.tfstate.d, we can have multiple set of environment variables associated.
- **modules**: from root we can call the child, they are invoked using source(of different supported types), explicitly mention the version(applicable when we are downloading from registry like terraform registry). Meta-args(lifecycle are not allowed) and input vars are also allowed. Calling module can access only output variables, remember the registry format.
- **output**: value, sensitive(still will show in tf.tfstate), description, default(is not allowed).
- **function**: element, lookup, length, zipmap, file
- **meta-arg**:
  - **count** - count and count.index
  - **s**
- **state lock**: lock need to be supported by backend, unlock is forced if required `tf force-unlock`, lock is only for write operations.
- **Best practices**:
  - access key and secret key should not be part of the code, either in provider or in backend.
  - 