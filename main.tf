# Applies the Azure specific resources, if needed.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.49"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4"
    }
  }
}

locals {
  # Explicitly add scope to assignable scopes: this avoids unnecessary updates
  # when comparing Terraform state to upstream state without have to ignore all
  # changes to assignable_scopes.
  assignable_scopes = concat([var.scope], var.assignable_scopes != null ? var.assignable_scopes : [])
}

resource "random_uuid" "role_name" {
  keepers = {
    scope = var.scope
  }
}

resource "azurerm_role_definition" "xc" {
  name              = coalesce(var.name, random_uuid.role_name.result)
  description       = coalesce(var.description, "Allow F5 Distributed Cloud to fully manage Azure resources")
  scope             = var.scope
  assignable_scopes = local.assignable_scopes

  permissions {
    actions = [
      "*/read",
      "Microsoft.Authorization/roleAssignments/*",
      "Microsoft.Compute/disks/delete",
      "Microsoft.Compute/virtualMachineScaleSets/delete",
      "Microsoft.Compute/virtualMachineScaleSets/write",
      "Microsoft.Compute/virtualMachines/delete",
      "Microsoft.Compute/virtualMachines/write",
      "Microsoft.Marketplace/offerTypes/publishers/offers/plans/agreements/*",
      "Microsoft.MarketplaceOrdering/agreements/offers/plans/cancel/action",
      "Microsoft.MarketplaceOrdering/offerTypes/publishers/offers/plans/agreements/write",
      "Microsoft.Network/loadBalancers/*",
      "Microsoft.Network/locations/setLoadBalancerFrontendPublicIpAddresses/action",
      "Microsoft.Network/networkInterfaces/*",
      "Microsoft.Network/networkSecurityGroups/delete",
      "Microsoft.Network/networkSecurityGroups/join/action",
      "Microsoft.Network/networkSecurityGroups/securityRules/delete",
      "Microsoft.Network/networkSecurityGroups/securityRules/write",
      "Microsoft.Network/networkSecurityGroups/write",
      "Microsoft.Network/publicIPAddresses/delete",
      "Microsoft.Network/publicIPAddresses/join/action",
      "Microsoft.Network/publicIPAddresses/write",
      "Microsoft.Network/routeTables/delete",
      "Microsoft.Network/routeTables/join/action",
      "Microsoft.Network/routeTables/write",
      "Microsoft.Network/virtualHubs/delete",
      "Microsoft.Network/virtualHubs/read",
      "Microsoft.Network/virtualHubs/write",
      "Microsoft.Network/virtualNetworks/delete",
      "Microsoft.Network/virtualNetworks/peer/action",
      "Microsoft.Network/virtualNetworks/subnets/*",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write",
      "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete",
      "Microsoft.Network/virtualNetworks/write",
      "Microsoft.Resources/subscriptions/resourcegroups/*"
    ]
  }
}

resource "azurerm_role_assignment" "xc" {
  for_each           = var.principals != null ? var.principals : []
  scope              = var.scope
  role_definition_id = azurerm_role_definition.xc.role_definition_resource_id
  principal_id       = each.value
  description        = "F5 Distributed Cloud custom role assignment"
}
