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


## Directory tree  

![image](https://user-images.githubusercontent.com/43320775/209651143-b2cee656-5344-4435-b02e-e8aef3d659f0.png)


1. ./app contains the manifist files of the lamp stack 
2. ./app/php contains the code and the docker file
3. ./github/workflows contains githup actions files 
4. cicddeployment.yaml && iaas_pipeline.yaml are azure devops files
5. ./modules contains terraform modules cluser, k8s, keyvault and service principal 
6. main.tf is Terraform main file to call the ready modules
7. variables.tf and terraform.tfvars are terraform variables files 


### Build The Environment :

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
 **AKS_Deplument**

```
az logine 
az account set --subscription <your subscriptionid>
az aks get-credentials --resource-group <your resource group> --name <cluster name>
kubectl apply -f mysql.yaml && kubectl apply -f php.yaml kubectl apply -f secrets.yaml kubectl apply -f data-loader-job.yaml


