# Installation

Install a Kubernetes cluster on your laptop!

Requirements: Docker

## Linux

Maybe your distribution has `kind` and `kubectl` packages, otherwise:

### Kind

```
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
```

### Kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

## MacOS

### Kind

```
brew install kind
```

OR

```
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-darwin-amd64
```

### Kubectl

```
brew install kubectl
```

OR

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
```

## Windows

### Kind

```
curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.24.0/kind-windows-amd64
```

OR

```
choco install kind
```

### Kubectl

```
choco install kubernetes-cli
```

OR

```
curl.exe -LO "https://dl.k8s.io/release/v1.31.0/bin/windows/amd64/kubectl.exe"
```

## Verify installation

### Cluster created

```
$ kind get clusters
carla
```

### Kubeconfig file configured to interact with our cluster

```
$ kubectl config current-context
kind-carla
```

### kubectl interaction with cluster is working

```
$ kubectl cluster-info --context kind-carla
Kubernetes control plane is running at https://127.0.0.1:59786
CoreDNS is running at https://127.0.0.1:59786/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

## Install application

Apply manifest.

```
kubectl apply -f http-echo.yaml
```

Check deployment

```
kubectl get deployments -n http-echo
```

```
kubectl get pods -n http-echo
```

```
kubectl get svc -n http-echo
```

## Interact with echo-server

Locally, ingresses are tricky. They will "just work" on public clouds though.

As a workaround, create a proxy to our service:

```
kubectl port-forward service/http-echo 8080:80 -n http-echo
```

cURL echo-server

```
curl 'http://localhost:8080'
```

## Delete echo-server

```
kubectl delete namespace http-echo
```
