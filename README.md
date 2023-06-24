# A Helm chart to sell cats on Kubernetes

## Deploy OVH cluster with Terraform
make sure to create the file ./terraform/variable.tfvars with the corresponding environment variables

### Create cluster
```
terraform plan --var-file="variable.tfvars"
terraform apply --var-file="variable.tfvars"
```

then copy past the kubeconfig output 

### Delete cluster
```
terraform destroy --var-file="variable.tfvars" 
```

## Start local T-CLO-902
```
helm dependency build
charts/t-clo-902
helm install <RELEASE-NAME> . -f ../../values.yml
```

## Delete local T-CLO-902
```
helm delete <RELEASE-NAME> && kubectl delete pvc data-<RELEASE-NAME>-mysql-0 && kubectl delete pvc data-<RELEASE-NAME>-rabbitmq-0 
```

## Enable nginx-ingress (only needed in minikube)

Minikube cluster (don't forget to remove the dependency)
```
minikube addons enable ingress
```

## Add helm repo (distant gh pages)
```
helm repo add waffle-man https://benjyhy.github.io/waffle-man/
```

## Start T-CLO-902 Project
```
helm install <RELEASE-NAME> waffle-man/t-clo-902
```
