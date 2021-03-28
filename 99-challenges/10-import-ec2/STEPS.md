# Import a manually created resource

Import a EC2 instance that was created manually on AWS.

As of now only state files will be created, terraform configuration is NOT automatically created.

## Steps are as follow

- Create a new EC2 instance
- Copy the instance id for example: i-0ea045f24b549a1c3
- Create a provider mentioning ec2 and region.
- Create a new configuration, refer ec2.tf (Note: fill the required fields only, later you can fill other values that are required)
- execute the command import: `tf import aws_instance.manual <ec2_id>`
- then try to destroy using `tf destroy`
