output "kube_config" {
    value = azurerm_kubernetes_cluster.aks-cluster.kube_config_raw
}

# output "cluster_ca_certificate" {
#     value = azurerm_kubernetes_cluster.aks-cluster.kube_config.cluster_ca_certificate
# }

# output "client_certificate" {
#     value = azurerm_kubernetes_cluster.aks-cluster.kube_config.client_certificate
# }

# output "client_key" {
#     value = azurerm_kubernetes_cluster.aks-cluster.kube_config.client_key
# }

output "host" {
    value = azurerm_kubernetes_cluster.aks-cluster.kube_config
}