variable "node_count" {
    default = 1
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "azure-k8stest"
}

variable location {
    default = "East US"
#    default = "Australia East" # available on free tier
}

variable "vm_size" {
    default = "Standard_B2s"
}
variable "aks_service_principal_app_id" {
  default  =  "44922970-f11c-4f5a-8434-0b25061107d1"
}

variable "aks_service_principal_client_secret" {
  default  =  "DYJ8Q~5YlF8MkpzEjhT6lX.Hbq3SvcM7_stP9dhQ"
}