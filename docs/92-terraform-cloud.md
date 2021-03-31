# Terraform Cloud

A SaaS offering by Hashicorm. Its a hosted service at [Terraform-cloud](https://app.terrafrom.io). It runs terraform on disposable virtual machines in its own cloud infrastructure, also known as remote execution/remote operations.

Terraform cloud was previously known as terraform enterprise, the self hosted distribution was called private terraform enterprise (PTFE). Terraform cloud and enterprise are same application.

terraform cloud features on high level:

- **Consistent environment to run terraform**: else different developer may have different versions.
- **Policy check(paid plan)**: like resources should have tags, we can define our custom policies and policy sets.
- **Cost estimation(paid plan)**: estimate the cost of the resources that are planned to be deployed as part of terraform apply.
- **Adding comments by different team members**: beneficial to collaborate.
- **State file is maintained with in the cloud**: no need to use s3 or other enhance backend for saving the state
- **Variable support**: this will allow you to add environment variables like AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION as well as Terraform variables same as tfvars.
- **Private Terraform module registry with version control**: custom modules can be published in the terraform cloud.
- **Access control**: who can approve the changes for apply. Team based permissions, sentinel policies.
- **Workspace based organization model**: help you to segregate terraform based on teams.
- **Cross workspace data sharing**: data can be shared between workspaces.
- **Support for local execution/ CLI integration**: By default remote execution is enabled, however user can choose to run it locally. Very helpful when you want to run `terraform plan` multiple time while editing the configurations. The command will start a remote run in the configured terraform cloud workspace, the output of the run streams directly to your terminal, and you can also share a link to the remote run with your teammates. Also it uses both current working directory's terraform and remote workspace's variables, so you don't need to obtain production cloud credentials for simple tf tasks.
- **API driven**: everything in Terraform is API, hence we can perform anything using terraform cloud api, like create or configure workspaces, upload configurations, start terraform runs and more. Good part is terraform cloud itself is a provider.
- **Notifications**: it notifies users of terraform runs to any system which supports webhooks like slack etc. Notifications are configured based on workspace, hence each team can have custom configurable notifications.
- **Settings**:
  - **Configure VCS**: integration with different version control systems like github or bitbucket.
  - **policy configuration**: this policies can be defined as code and can be enforced on the resource that are applied.

## Price

There are different pricing model available,

- free account for small users,
- and paid plans with additional features sets for medium-size businesses. (20$ per user)
- terraform enterprise our self hosted distribution of terraform cloud.
  - no resource limits
  - enterprise-grade architecture features like audit logs, SAML sso

## Use of terraform cloud

- Sign up
- Create a organization
- Create a workspace
  - integrate with version control: this can be done by creating a oauth application and integrating that with terraform cloud by providing - clint id and client secret. Next update the callback URL in the github oauth application. Step -by-step documentation is provided by terraform. Last step is to authorize terraform cloud to access github.
  - choose repository
  - configure settings
- configure variables
  - environment variable: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION.
- in github create a repo with configuration only, simplest will be to create a eip on aws. use the below code and keep one file(eip.tf) in the repo. NOTE: we have not configured any providers in the repo.

```hcl
resource "aws_eip" "my-eip" {
    vpc = "true"
}
```

- click on queue plan - this will go ahead and run tf plan.
  - there are two primary state: Plan and apply (before applying it will wait for manual approval)
  - user have three option once the plan is successfully executed.
    - Confirm and apply
    - Discard Run
    - Add comment

## For paid plan

We can choose for **cost estimation** and **Policy check**. When you enable this, automatically a step will be inserted between plan and apply.

## Sentinel

They are paid feature of terraform cloud.

Sentinel is an embedded policy-as-code framework integrated with the hashicorp enterprise products.

Allows fine-grained, logic based policy and can be extended to use information from external sources.

Again, sentinel checks are inserted in between plan and apply.

**How the are configured?**:

- first create a policy-set, with no VCS connection. *one can integrate with VCS as well*. It can be for all workspaces or for specific workspaces.
- next, create the policy:
  - name
  - enforcement mode: hard mandatory(can be overridden), soft mandatory(can be overridden), advisory (will just show an warning message on the in the run)
  - code
    ``` py
    import "tfplan"

    main = rule {
        all tfplan.resources.aws_instance as _, instance {
            all instances as _ r {
                (length(r.applied.tags) else 0) > 0
            }
        }
    }
    ```
    - select the policy set with which it should be associated.

## Backend

select backend as terraform cloud, this backend store the tf state file, and also executes terraform.

Live demo: https://github.com/iAbhishek91/learn-terraform-cloud

### Steps

- Step-1: Create a workspace(with or without a vcs connection). Just enter the name and create the configurations.
- Step-2: Create the two files as below

```hcl
// backend.hcl
workspace { name = "demo-workspace" } // terraform workspace name
hostname = "app.terraform.io" // hostname of the terraform
organization = "demo-org"

// iam.tf
terraform {
  required_version = "~> 0.12.0"

  backend "remote" {} // this indicate that this is remote backend
}

resource "aws_iam_user" "abhi" {
    name = "abhishek"
    path = "/system/"
}
```

- Step-3: `tf login` this will login into the terraform cloud. 

```sh
tf login
#will basically request an API token for the backend mentioned from the browser. If login is successful, Terraform will store  the token in plain text in the following file for use by subsequent commands.

#C:\Users\abhishek\AppData\Roaming\terraform.d\credentials.tfrc.json

#Terraform must now open a web browser to the tokens page for app.terraform.io.

#If a browser does nto open this automatically, open the following URL to proceed:
# https://app.terraform.io/app/settings/token?source=terraform-login

# Generate a token using your browser, and copy-paste it into this prompt.

# Terraform will store the token in plain text in the following file for use by subsequent commands:
# C:\User\Abhishek\Roaming\terraform.d\credentials.tfrc.json

# Token for app.terraform.io: note when you paste nothing will be displayed

# Retrieved token for user abhishek

# Success! Terraform has obtained and save and API token.

# The new aPI token will be used for any future terraform command that must make authenticated requests to app.terraform.io
```

- Step-4: `terraform init -backend-config=backend.hcl`
- Step-5: create the environment variable:  AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION.
- Step-6: `terraform plan`
- Step-7: `terraform apply`

This is called remote operation.
