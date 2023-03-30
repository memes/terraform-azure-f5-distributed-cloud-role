# F5 Distributed Cloud Role Terraform module

![GitHub release](https://img.shields.io/github/v/release/memes/terraform-azure-f5-distributed-cloud-role?sort=semver)
![Maintenance](https://img.shields.io/maintenance/yes/2023)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

This Terraform module is a helper to create a custom IAM role that has the
permissions required for F5 Distributed Cloud to manage an Azure environment.

I have similar modules available for [AWS](https://github.com/memes/terraform-aws-f5-distributed-cloud-role)
and [Google Cloud](https://github.com/memes/terraform-google-f5-distributed-cloud-role).

> **NOTE:** This module is unsupported and not an official F5 product. If you
> require assistance please join our
> [Slack GCP channel](https://f5cloudsolutions.slack.com/messages/gcp) and ask!

## Examples

### Create the custom role at the project, and assign to an existing service account

See [Simple project role](examples/simple_project_role) example for more details.

<!-- spell-checker: disable -->
```hcl
TBD
```
<!-- spell-checker: enable -->

<!-- spell-checker:ignore markdownlint bigip -->
<!-- markdownlint-disable MD033 MD034 -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
