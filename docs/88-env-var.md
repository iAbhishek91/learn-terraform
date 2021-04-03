# Terraform env

These env vars are used by TF CLI, this values can be configured in `.terraformrc` or in `.terraform.rc`.

- TF_VAR_ : variable values | TF_VARS_a = b
- TF_LOG : log level | TF_LOG = TRACE
- TF_LOG_PATH : where logs are outputs | TF_LOG_PATH = "/path/to/variable"
- TF_INPUT: treat it as -input=false | TF_INPUT=0
- TF_CLI_ARGS: same as passing anything in tf command | TF_CLI_ARGS="-input=false"
- TF_CLI-ARGS_<command-name>: CLI args only for a particular command | TF_CLI_ARGS_plan command
- TF_CLI_CONFIG_FILE: path to cli config file | TF_CLI_Config-file="/a/a"
- TF_DATA_DIR: directory of .terraform | TF_DATA_DIR="/path/to/dir"
- TF_WORKSPACE: same as tf select | TF_WORKSPACE=your_workspace
- TF_IN_AUTOMATION: suggestion outputs are suppressed, and o/p are more human readable.| TF_IN_AUTOMATION=anything
- TF_REGISTRY_DISCOVERY_RETRY: how many retry if not able to connect | TF_REGISTRY_DISCOVERY_RETRY=3
- TF_REGISTRY_CLIENT_TIMEOUT: time out for connection (default 10s) | TF_REGISTRY_CLIENT_TIMEOUT=15
- TF_IGNORE: in debug message it will display ignorefiles and folders | TF_IGNORE=trace
