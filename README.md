## A Helm chart to sell cats on Kubernetes

```
kubectl create secret docker-registry ghcr-credentials --docker-server=https://ghcr.io --docker-username=benjyhy --docker-password=<PAT> --docker-email=ramet.benj@gmail.com
```

```
helm -n ingress-nginx install ingress-nginx ingress-nginx/ingress-nginx --create-namespace
```

```
#!/bin/bash
AMQP_RELEASE_NAME="amqp-$1"
ES_RELEASE_NAME="elasticsearch-$1"

kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
# wait a bit for the es CRD to be ready

helm install $AMQP_RELEASE_NAME oci://registry-1.docker.io/bitnamicharts/rabbitmq
# wait a bit for the amqp cluster to be ready

helm install $ES_RELEASE_NAME waffle-man/es
# wait a bit for the es resources to be ready

helm install $1 waffle-man/t-clo-902
```
