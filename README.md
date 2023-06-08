# A Helm chart to sell cats on Kubernetes

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

## Enable nginx-ingress 

Minikube cluster
```
minikube addons enable ingress
```

Other cluster
```
helm repo add ingress-nginx https://helm.nginx.com/stable
helm install ingress-nginx ingress-nginx/ingress-nginx --version 0.17.1
```


## Add helm repo and elasticsearch operator
```
kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
helm repo add waffle-man https://benjyhy.github.io/waffle-man/
```

## Start elasticsearch dependencies
```
helm install elasticsearch-<RELEASE-NAME> waffle-man/es
```

## Start T-CLO-902 Project
```
helm install <RELEASE-NAME> waffle-man/t-clo-902
```
