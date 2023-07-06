#!/bin/bash
AMQP_RELEASE_NAME="amqp-$1"
ES_RELEASE_NAME="elasticsearch-$1"

kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.1.0/cert-manager.crds.yaml

helm install $AMQP_RELEASE_NAME oci://registry-1.docker.io/bitnamicharts/rabbitmq
helm install $ES_RELEASE_NAME waffle-man/es
helm install cert-manager oci://registry-1.docker.io/bitnamicharts/cert-manager
helm install $1 waffle-man/t-clo-902