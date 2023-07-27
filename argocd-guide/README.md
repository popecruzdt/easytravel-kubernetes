#### ArgoCD Setup Guide
https://argo-cd.readthedocs.io/en/stable/getting_started/

latest stable version
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

July 2023 v2.7.9
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.7.9/manifests/install.yaml
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v2.7.9/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

change UI server service from ClusterIP to LoadBalancer (external facing URL)
```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

obtain external facing URL
```
kubectl get service -n argocd argocd-server
```

obtain initial password
```
argocd admin initial-password -n argocd
```

connect to argocd using cli with user, password, and external facing URL
```
argocd login <EXTERNAL-IP>
```

change the admin password
```
argocd account update-password
```




