## A Helm chart to sell cats on Kubernetes

```
kubectl create secret docker-registry ghcr-credentials --docker-server=https://ghcr.io --docker-username=benjyhy --docker-password=<PAT> --docker-email=ramet.benj@gmail.com
```

```
helm -n ingress-nginx install ingress-nginx ingress-nginx/ingress-nginx --create-namespace
```

```
bash release-it.sh <release-name>
```
