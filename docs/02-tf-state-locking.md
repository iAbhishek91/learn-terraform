# State locking

Terraform state locking is a mechanism which will lock the state file while performing write operations. As parallel write operation is corrupt the state-file as well as the underlying infrastructure.

for example: one person trying to destroy and another is trying to update the configurations.

## What terraform does under the hood

terraform plan would lock the state for that particular time.

> IMPORTANT NOTE: the locking is not available if we are using remote backend while performing terraform plan. Locking functionality is a feature supported backend, hence choose your backend carefully.
> On the same point above, for s3, if you read the documentation, locking feature is available with help of DynamoDB. Refer below section "s3 state locking".

```sh
tf plan
# OUTPUT:
# Error: Error locking state: Error acquiring the state lock: The process cannot access the file because another process has # locked a portion of the file.
# Lock INFO:
#     ID: d2b7b9ad-f26c-dc99-23na-23423nkjjj23421
#     Path: terraform.tfstate
#     Operation: OperationTypePlan
#     Who: DESKTOP-LE3E080\Zeal Vora@DESKTOP-LE3E080
#     Version: 0.14.8
#     Created: 2021-03-23: 02:03:40.234234 +0000 UTC
#     Info:
# 
# Terraform acquires a state lock to protect the state from being written by multiple users at the same time. Please resolve # the issue above and try again. Fro most commands, you can disable locking with the "-lock=false" flag, bu this is not # recommended.
```

## S3 State locking using Dynamo DB

In the backend configuration, just keep the DynamoDB table info(dynamodb_table=table_name) for enabling state-locking mechanism.
