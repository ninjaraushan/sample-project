resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name                = "default"
        node_count          = var.node_count
        vm_size             = var.vm_size
        enable_auto_scaling = false
    }

    identity {
        type = "SystemAssigned"
    }


    tags = {
        Environment = "Development"
    }
}


data "azuread_service_principal" "aks_principal" {
  application_id = var.aks_service_principal_app_id
}

resource "azurerm_container_registry" "myacr" {
  name                = "samplewebregistry123"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"

}


resource "azurerm_role_assignment" "aksroleforacr" {
  principal_id                     = data.azuread_service_principal.aks_principal.id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.myacr.id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_container_registry.myacr,
    azurerm_kubernetes_cluster.k8s
  ]
}