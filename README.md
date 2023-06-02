# A Helm chart to sell cats on Kubernetes

## Create docker pull secret
```
kubectl create secret docker-registry ghcr-credentials --docker-server=https://ghcr.io --docker-username=<USERNAME> --docker-password=<PAT> --docker-email=<EMAIL>
```

## Enable nginx-ingress 

Minikube cluster
```
minikube addons enable ingress
```

Other cluster
```
helm repo add ingress-nginx https://helm.nginx.com/stable
helm install ingress-nginx nginx/nginx-ingress --version 0.17.1
```


## Add helm repo and elasticsearch operator
```
kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
helm repo add waffle-man https://benjyhy.github.io/waffle-man/
```

## Start rabbitmq and elasticsearch dependencies
```
helm install amqp-<RELEASE-NAME> oci://registry-1.docker.io/bitnamicharts/rabbitmq
helm install elasticsearch-<RELEASE-NAME> waffle-man/es
```

## Start T-CLO-902 Project
```
helm install <RELEASE-NAME> waffle-man/t-clo-902
```

## Update helm repo for local changes
```
cd charts/t-clo-902
helm install <RELEASE-NAME> . -f ../../values.yml
```
