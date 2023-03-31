# F5 Distributed Cloud Role Terraform module

![GitHub release](https://img.shields.io/github/v/release/memes/terraform-azure-f5-distributed-cloud-role?sort=semver)
![Maintenance](https://img.shields.io/maintenance/yes/2023)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

This Terraform module is a helper to create a custom Azure role that has the
permissions required for F5 Distributed Cloud to manage an Azure environment.

I have similar modules available for [AWS](https://github.com/memes/terraform-aws-f5-distributed-cloud-role)
and [Google Cloud](https://github.com/memes/terraform-google-f5-distributed-cloud-role).

> **NOTE:** This module is unsupported and not an official F5 product. If you
> require assistance please join our
> [Slack Azure channel](https://f5cloudsolutions.slack.com/messages/azure) and ask!

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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.49 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.xc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_definition.xc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [random_uuid.role_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignable_scopes"></a> [assignable\_scopes](#input\_assignable\_scopes) | Sets additional assignable scopes for the custom role; default is an empty list. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The optional description to assign to the custom Azure role. If left blank (default),<br>a suitable description will be created. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name to use for the new role; default is an empty string which will<br>generate a unique identifier. If a value is provided, it must be valid within<br>the scope indicated by `scope` variable. | `string` | `null` | no |
| <a name="input_principals"></a> [principals](#input\_principals) | An optional set of service principals UUIDs that will be assigned the custom<br>role. Default is an empty set. | `set(string)` | `[]` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | Sets the scope for role creation. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_definition_id"></a> [role\_definition\_id](#output\_role\_definition\_id) | The role definition ID for the custom role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable MD033 MD034 -->
