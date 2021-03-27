# Challenges with large infrastructure for same project

Large infrastructure, you will face issue related to API limits for a provider.

For example:
API limits are challenges when we run massive terraform scripts. Mainly for server hardening was difficult. For these we need to take care of many things apart from tf configuration scripts.

- to take care of this, we need to switch to smaller configuration which can be independently deployed.
- segregation can be done based on resources or features. The ideas is restrict parallel requests and hitting the API limits.
- In case the terraform already exists,you can reduce the number of API calls(made for refreshing each resource) by using, don't use it extensively.
  - `tf plan -refresh=false` command, this will stop from plan to get the latest state for any resource(note: until and unless you are absolutely sure of the state don't do it)
  - `tf plan -target=ec2.name` run plan only for target resource instead of *.
