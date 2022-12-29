# Solution Brief:
This repo is an example for CICD solution to build and deploy you application over Azure kubernetes service using terraform as Iaas and github actions as a cicd tool.

## Architecture
<img width="946" alt="image" src="https://user-images.githubusercontent.com/43320775/209651834-63653124-d775-4c9e-9a43-e5e4a6546333.png">


## Application

Simple HTTP service  has a `/live` endpoint. 

The following responses are possible:

- `Well done` : if the application was able to connect with a database
- `Maintenance`: if some error occurred during the connection with the database


## Technologies and Tools

1. Terraform .
2. LAMP stack .
3. Docker
4. Github Actions .
5. Azure
6. Prometheus and Grafana


## Terraform Modules:

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

## Directory tree  

![image](https://user-images.githubusercontent.com/43320775/209651143-b2cee656-5344-4435-b02e-e8aef3d659f0.png)


1. ./app contains the manifist files of the lamp stack 
2. ./app/php contains the code and the docker file
3. ./github/workflows contains githup actions files 
4. cicddeployment.yaml && iaas_pipeline.yaml are azure devops files
5. ./modules contains terraform modules cluser, k8s, keyvault and service principal 
6. main.tf is Terraform main file to call the ready modules
7. variables.tf and terraform.tfvars are terraform variables files 


### Build The Environment Locally :

 **Infrastructure**

```
terraform init
terraform plan 
terraform apply 

```
 **Dockerfile**

```
cd ./app/php/
docker login
docker build -t <your container registery>:latest
docker push <your container registery>:latest

```
 **AKS Deplyments**

```
az logine 
az account set --subscription <your subscriptionid>
az aks get-credentials --resource-group <your resource group> --name <cluster name>
kubectl apply -f mysql.yaml && kubectl apply -f php.yaml kubectl apply -f secrets.yaml kubectl apply -f data-loader-job.yaml

```
**AKS_Monitoring**

```
create -f ./monitoring/setup  #prometheus operator
create -f ./monitoring/

```

# View Dashboards 

You can access the dashboards by using `port-forward` to access Grafana.
It does not have a public endpoint for security reasons

```
kubectl -n monitoring port-forward svc/grafana 3000
```

Then access Grafana on [localhost:3000](http://localhost:3000/)


## Check Prometheus 

we can also check Prometheus:

```
kubectl -n monitoring port-forward svc/prometheus-operated 9090
```
