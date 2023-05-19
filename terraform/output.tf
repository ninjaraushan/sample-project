output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}

output "get_credentials" {
  value = "az aks get-credentials --name ${var.cluster_name} --resource-group ${var.resource_group_name} --admin -f -"
}
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive = true
}