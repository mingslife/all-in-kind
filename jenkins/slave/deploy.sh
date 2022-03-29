#!/bin/sh

source ./.env

kubectl config set-cluster kubernetes \
  --certificate-authority=/kube/ca.crt \
  --server=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT \
  --embed-certs=true
kubectl config set-credentials user --token=$token
kubectl config set-context kubernetes \
  --cluster=kubernetes --user=user --namespace=$namespace
kubectl config use-context kubernetes

if [ '$CHARTMUSEUM_URL' != '' ]; then
  helm cm-push -f chart/$APP_NAME $CHARTMUSEUM_URL
fi

helm upgrade $APP_NAME chart/$APP_NAME --install
