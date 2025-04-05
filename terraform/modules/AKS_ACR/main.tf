# Create a resource group
resource "azurerm_resource_group" "encadrinyplatform" {
  name     = "encadrinyplatform"
  location = "eastus"

}
# create acr Container registery
# resource "azurerm_container_registry" "acr" {
#   name                = "encadrinyplatformcontainerRegistry"
#   location            = azurerm_resource_group.encadrinyplatform.location
#   resource_group_name = azurerm_resource_group.encadrinyplatform.name
#   sku                 = "Premium"
#   admin_enabled       = false
# }
# create AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "encadrinyplatformaks"
  location            = azurerm_resource_group.encadrinyplatform.location
  resource_group_name = azurerm_resource_group.encadrinyplatform.name
  dns_prefix          = "encadrinyplatform"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
# create role assignment for aks acr pull
# resource "azurerm_role_assignment" "example" {
#   principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
# }