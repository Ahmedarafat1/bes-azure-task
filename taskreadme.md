## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ServicePrincipal"></a> [ServicePrincipal](#module\_ServicePrincipal) | ./modules/serviceprincipal | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/cluster/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.rolespn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"canadacentral"` | no |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | resource group name | `string` | n/a | yes |
| <a name="input_service_principal_name"></a> [service\_principal\_name](#input\_service\_principal\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
