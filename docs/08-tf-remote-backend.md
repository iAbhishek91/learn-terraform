# Remote backend

Remote backend are remote plae where you can save your state files.

This is useful when we are working with **multiple team members**.

Optionally we can also use **terraform cloud**.

Basically what it does is it keeps the file in a remote place. Generally **S3 or CloudStorage** is used. *We need to turnon versioning so that the changes are tracked along with lifecycle.*

Then we need to configure terraform to store the statefile to the remote place instead of local.