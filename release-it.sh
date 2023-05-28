#!/bin/bash
AMQP_RELEASE_NAME="amqp-$1"
helm install $AMQP_RELEASE_NAME oci://registry-1.docker.io/bitnamicharts/rabbitmq
kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
kubectl apply -f elastic.yaml
helm install $1 waffle-man/t-clo-902