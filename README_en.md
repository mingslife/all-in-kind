# All in KIND

English | [中文](README.md)

This guide aims to set up a full operational Kubernetes environment quickly on your personal computer by [Kind](https://github.com/kubernetes-sigs/kind), a tool for running local Kubernetes clusters using Docker container "nodes".

You can learn how to build a production-ready Kubernetes cluster steps by steps under the guidance.

First of all, because it bases on Kind, you should ensure you have installed Docker.

## Install Kind

Following contents' origin of this part is [HERE](https://github.com/kubernetes-sigs/kind#installation-and-usage).

On Linux:

```bash
curl -Lo /usr/local/bin/kind "https://kind.sigs.k8s.io/dl/v0.11.1/kind-$(uname)-amd64"
chmod +x /usr/local/bin/kind
```

On macOS (via Homebrew):
```bash
brew install kind
```

On Windows (via Chocolatey):
```powershell
choco install kind

# Or you could try winget, Windows official package manager :)
```

## Create cluster

For conveience of accessing and persistence, I wrote a configuration file "[config.yaml](config.yaml)", telling Kind to expose port 80 and 443, and to mount a folder into the container. The path of the folder is "/root/kind", and you can replace it to where you want to storage your data.

```bash
kind create cluster --config config.yaml
```

After that, we can get a local Kubernetes cluster only in several minutes! Awesome! Good job, Kind!

## Install ingress

We use Nginx Ingress as our Kubernetes Ingress Component.

```bash
kubectl apply -f ingress-nginx.yaml
```

## Build up infrastructure

```bash
kubectl create namespace infra

# Install Registry
kubectl apply -f registry.yaml

# Install Chartmuseum

# Install Mariadb
kubectl apply -f mariadb.yaml
```
