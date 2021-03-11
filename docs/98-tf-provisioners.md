# Provisioners

Provisioner can be used to model specific actions on the local machine or on remote machine in order to prepare servers or other infra objects.

NOTE: Provisioners are last resort.

**WHY PROVISIONERS EXISTS?**

They exists as terraform cant map all behavior in its declarative model.

These behavior adds considerable amount of complexity and uncertainty to Terraform usage. WHY? Because of two reason:

- They can be mapped with Terraform declarative model, as they can in principle take any action.
- even if you use provisioners, it requires coordination of many more details than terraform usage usually requires.

Its suggested not to user provisioners in most of the scenarios. There are other better solution available.
