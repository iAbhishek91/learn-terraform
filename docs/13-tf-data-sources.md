# Data Sources

This is a way terraform can query providers to **fetch data**.

They do not set anything, its GET call made under the hood, so that it can be used somewhere else in the configuration.

> Ref: xx-data-sources

Useful scenario: we see that few values are hard-coded like (ami id), now this is not a good practice as ami-id changes based on region and for same region it keeps changing. So its better we fetch the id using terraform and use it.

Like resource, data source also have a list of attribute. Refer terraform documents.
